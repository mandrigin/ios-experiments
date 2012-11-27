//
//  GamePlayLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GamePlayLayer.h"
#import "GhostyWindow.h"
#import "cocos2d.h"
#import "GhostyWindowState.h"
#import "LevelStorage.h"
#import "Level.h"
#import "LevelFactory.h"

#define SHOW_GHOSTS_DELAY 5.0f;

@implementation GamePlayLayer

+(id) createWithHeight:(int)height andWidth:(int)width {
    return [[[self alloc] initWithSize:height:width] autorelease];
}

-(void)start {
    for(GhostyWindow *gw in windows) {
        [gw showPreview];
        self->state = kPreview;
    }
    [self schedule:@selector(onGameTick) interval:1.0];
}

-(void)onGameTick {
    if(![[CCDirector sharedDirector] isPaused] && self->state != kFinished) {
        self->currentTime++;
        
        switch (state) {
            case kPreview:
                if(self->currentTime > self->previewTime) {
                    [self hideWindows];
                    self->state = kGame;
                    self->currentTime = 0;
                }
                break;
                
            case kGame:
                if(self->currentTime > self->levelTime) {
                    self->state = kFinished;
                    [self showResult];
                }
                break;
                
            default:
                break;
        }
    }
}

-(void)showResult {
    RoundResult result = kRoundWin;
    for(GhostyWindow *gw in windows) {
        if(![gw isCorrect]) {
            if([gw getState] == kBadMan) {
                result = kRoundLoseBadman;
            } else {
                result = kRoundLose;
            }
        }
    }
    
    if(result == kRoundWin) {
        [self showYouWinMessage];
    } else {
        [self showYouLoseMessage];
    }
}


-(void)hideWindows {
    for(GhostyWindow *gw in windows) {
        [gw showNormalState];
    }
}


-(void)onLevelFail {
    [self showYouLoseMessage];
}

-(void)checkResult {
    bool isCorrect = true;
    for(GhostyWindow *gw in windows) {
        if(![gw isCorrect]) {
            isCorrect = false;
        }
    }
    if(isCorrect) {
        [self showYouWinMessage];
    }
}

-(void)showYouWinMessage {
	UIAlertView* dialog = [[UIAlertView alloc] init];
	[dialog setDelegate:self];
	[dialog setTitle:@"Wow! You're the winner!"];
	[dialog setMessage:@"Greatest 4 ever!"];
	[dialog addButtonWithTitle:@"Fuck yeah!"];
	[dialog show];
	[dialog release];
}

-(void)showYouLoseMessage {
	UIAlertView* dialog = [[UIAlertView alloc] init];
	[dialog setDelegate:self];
	[dialog setTitle:@"Boo! It's a Bad Man!"];
	[dialog setMessage:@"Oh oh oh... Buddy, you lose!"];
	[dialog addButtonWithTitle:@"Okay"];
	[dialog show];
	[dialog release];
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
}

-(void)onWindowSelected:(GhostyWindow *)window {
    if([window getState] == kBadMan) {
        [self onLevelFail];
    } else {
        numberOfWindowsLeft--;
        if(numberOfWindowsLeft == 0) {
            [self checkResult];
        }
    }
}

-(void)onWindowDeselected:(GhostyWindow *)window {
    numberOfWindowsLeft++;
}

-(void)dealloc {
    [windows release];
    [storage release];
    [super dealloc];
}

-(id) initWithSize:(int)height :(int)width {
    self = [super init];
    self->storage = [LevelStorage create];
    
    Level *currentLevel = [(LevelFactory *)[[storage getFunTownLevels] objectAtIndex:0] createLevel];
    
    LevelSettings *settings = [currentLevel getSettings];
    
    self->numberOfWindowsLeft = [settings numOfGhosts];
    
    LevelLayout *layout = [settings getLayout];
    
    if(self != nil) {
        
        int rows = [layout rows];
        int cols = [layout columns];
        
        NSArray *playgroundData = [currentLevel getPlayground];
        
        NSInteger rowHeigth = (int)height / rows;
        NSInteger colWidth  = (int)width  / cols;
        
        int i;
        int j;
        
        int currentX = 0;
        int currentY = 0;
        
        windows = [[NSMutableArray alloc] init];
        
        self->previewTime = [[currentLevel getSettings] previewTime];
        self->levelTime  = [[currentLevel getSettings] levelTime];
        self->currentTime = 0;
        
        CCMenu *menu = [CCMenu menuWithItems:nil];
        [menu setPosition:ccp(0, 0)];
        
        for (i = 0; i < rows; ++i) {
            
            currentY = rowHeigth * i;
            
            for(j = 0; j < cols; ++j) {
                currentX = colWidth * j;
                
                GhostyWindowState state = (GhostyWindowState)[[playgroundData objectAtIndex: (cols * i + j)] intValue];
                
                GhostyWindow *windowSprite = [GhostyWindow createWithState:state layout:layout andCallback:^(GhostyWindow *sender) {
                    if([sender isSelected]) {
                        [self onWindowSelected:sender];
                    } else {
                        [self onWindowDeselected:sender];
                    }
                }];
                
                CGSize originalSize = [windowSprite contentSize];
                float originalWidth = originalSize.width;
                float originalHeight = originalSize.height;
                float newScaleX = (float)(colWidth) / originalWidth;
                float newScaleY = (float)(rowHeigth) / originalHeight;
                [windowSprite setScaleX:newScaleX];
                [windowSprite setScaleY:newScaleY];
                
                int offsetX = currentX + colWidth / 2;
                int offsetY = currentY + rowHeigth / 2;
                
                [windowSprite setPosition:ccp(offsetX, offsetY)];
                [menu addChild:windowSprite];
                [windows addObject:windowSprite];
                
            }
        }
        
        [self addChild:menu];
    }
    
    return self;
}

@end
