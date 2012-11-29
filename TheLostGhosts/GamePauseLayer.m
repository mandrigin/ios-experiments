//
//  GamePauseLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GamePauseLayer.h"
#import "cocos2d.h"

@implementation GamePauseLayer

-(id) init {
    self = [super init];
    
    if(self != nil) {
    
            // ask director for the window size
            
        CGSize size = [[CCDirector sharedDirector] winSize];
            
        CCSprite *background;
            
        background = [CCSprite spriteWithFile:@"game_bg_fun_town_pause.png"];
        
        background.position = ccp(size.width/2, size.height/2);
            
        // add the label as a child to this Layer
        [self addChild: background];
        
        CCMenuItemImage *pauseButton = [CCMenuItemImage
                                        itemFromNormalImage:@"img_pause_caption.png"
                                        selectedImage:@"img_pause_caption.png"
                                        
                                        block:^(id sender) {
                                            GamePauseLayer *gamePauseLayer = [GamePauseLayer node];
                                            
                                            [self addChild:gamePauseLayer z:50];
                                            
                                            [[CCDirector sharedDirector] resume];
                                         
                                        }];
        CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];
        
        hudMenu.position = ccp(size.width / 2, size.height/2.3);
        
        [self addChild: hudMenu z:10];

    
    }
    
    return self;
}

@end
