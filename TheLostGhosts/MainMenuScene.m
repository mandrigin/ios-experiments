//
//  MainMenuScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "MainMenuScene.h"
#import "GameScene.h"
#import "cocos2d.h"

@implementation MainMenuScene

-(id)init {
    self = [super init];
    
    if(self != nil) {
        // ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile:@"main_menu_background.png"];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        CCMenuItemImage *pauseButton = [CCMenuItemImage
                                        itemFromNormalImage:@"btn_start_normal.png"
                                        selectedImage:@"btn_start_pressed.png"
                                        
                                        block:^(id sender) {
                                            
                                            [[CCDirector sharedDirector] replaceScene:[GameScene node]];
                                            
                                        }];
        CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];
        
        hudMenu.position = ccp(size.width / 2, size.height/2.3);
        
        [self addChild: hudMenu];        
    }
    
    return self;
}

@end
