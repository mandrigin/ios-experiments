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
#import "Events.h"
#import "Tags.h"
#import "MainSceneLayout.h"

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
    
    
    CCMenuItemImage *startButton = [self createButtonFromNormalImage:@"btn_start_normal.png"
                                                       selectedImage:@"btn_start_normal.png"
                                                              andTag:MAINSCENE_START_BUTTON ];
    
    CCMenu *hudMenu = [CCMenu menuWithItems:startButton, nil];
    
    hudMenu.position = ccp( size.width * START_X_OFFSET_FACTOR
                          , size.height * START_Y_OFFSET_FACTOR);
    
    [self addChild: hudMenu z:10];
    
    CCSprite *caption = [CCSprite spriteWithFile:@"caption.png"];
	
    caption.position = ccp( size.width * CAPTION_X_OFFSET_FACTOR
                          , size.height * CAPTION_Y_OFFSET_FACTOR);
    
	// add the label as a child to this Layer
	[self addChild: caption z:5];
}

@end
