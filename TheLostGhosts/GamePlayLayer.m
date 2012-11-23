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

#define NUMBER_OF_ROWS 3;
#define NUMBER_OF_COLS 4;
#define SHOW_GHOSTS_DELAY 5.0f;

@implementation GamePlayLayer

+(id) createWithHeight:(int)height andWidth:(int)width {
    return [[[self alloc] initWithSize:height:width] autorelease];
}

-(void)start {
    // In one second transition to the new scene
    for(GhostyWindow *gw in windows) {
        [gw showPreview];
    }
    float delay = SHOW_GHOSTS_DELAY
    [self performSelector:@selector(hideWindows) withObject:nil afterDelay:delay];
}

-(void)hideWindows {
    for(GhostyWindow *gw in windows) {
        [gw showNormalState];
    }
}

-(void)dealloc {
    [windows release];
    [super dealloc];
}

-(id) initWithSize:(int)height :(int)width {
    self = [super init];
    
    LevelStorage *storage = [LevelStorage create];
    
    Level *currentLevel = [(LevelFactory *)[[storage getFunTownLevels] objectAtIndex:0] createLevel];
    
    LevelSettings *settings = [currentLevel getSettings];
    
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
        
        CCMenu *menu = [CCMenu menuWithItems:nil];
        [menu setPosition:ccp(0, 0)];
        
        for (i = 0; i < rows; ++i) {
            
            currentY = rowHeigth * i;
            
            for(j = 0; j < cols; ++j) {
                currentX = colWidth * j;
                
                GhostyWindowState state = (GhostyWindowState)[[playgroundData objectAtIndex: (cols * i + j)] intValue];
                
                GhostyWindow *windowSprite = [GhostyWindow create:state];
                
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
