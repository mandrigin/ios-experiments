//
//  GameHUDLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GameHUDLayer.h"
#import "GamePauseLayer.h"
#import "cocos2d.h"
#import "Game.h"

@implementation GameHUDLayer

-(id) initWithParent:(GameScene *)parent {
    self = [super init];
    
    self->parent = (GameScene *)parent;
    
    if(self != nil) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCMenuItemImage *pauseButton = [CCMenuItemImage
                                            itemFromNormalImage:@"btn_pause_normal.png"
                                            selectedImage:@"btn_pause_pressed.png"
                                        
                                            block:^(id sender) {
                                                
                                                [[[Game sharedGame] getGraphics] showPauseOverlay];
                                                [[CCDirector sharedDirector] pause];

                                            }];
        CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];

        hudMenu.position = ccp(size.width / 14, size.height/1.10);

        [self addChild: hudMenu];
    }
    return self;
}

@end
