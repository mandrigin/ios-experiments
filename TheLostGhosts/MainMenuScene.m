//
//  MainMenuScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "MainMenuScene.h"
#import "GameScene.h"
#import "DefaulBackgroundLayer.h"
#import "cocos2d.h"
#import "Game.h"

@implementation MainMenuScene

-(id)init {
    self = [super init];
    
    if(self != nil) {
        
        DefaulBackgroundLayer *defaultBackgroundLayer = [DefaulBackgroundLayer node];
        
        [self addChild: defaultBackgroundLayer];
    }
    
    return self;
}

-(void)onEnter {
    [super onEnter];
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCMenuItemImage *pauseButton = [CCMenuItemImage
                                    itemFromNormalImage:@"btn_start_normal.png"
                                    selectedImage:@"btn_start_pressed.png"
                                    
                                    block:^(id sender) {
                                        
                                        [[[Game sharedGame] getGraphics] showGameScene];
                                        
                                    }];
    
    CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];
    
    hudMenu.position = ccp(size.width / 2, size.height/2.3);
    
    [self addChild: hudMenu z:10];
    
    CCSprite *caption = [CCSprite spriteWithFile:@"caption.png"];
	
    caption.position = ccp(size.width/2, size.height/2);
    
	// add the label as a child to this Layer
	[self addChild: caption z:5];

}

@end
