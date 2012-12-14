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
    return [super initWithBackground:[DefaulBackgroundLayer node]];
}

-(void)onEnter {
    [super onEnter];
    
    CCSprite *caption = [self createTouchableSprite:@"caption.png" withTag:MAINSCENE_START_BUTTON];
    //[CCSprite spriteWithFile:@"caption.png"];
	
    caption.position = ccp( size.width * CAPTION_X_OFFSET_FACTOR
                           , size.height * CAPTION_Y_OFFSET_FACTOR);
    
	[self addChild: caption z:5];
    
    CCMenuItemImage *startButton = [self createButtonFromNormalImage:@"btn_start_normal.png"
                                                       selectedImage:@"btn_start_pressed.png"
                                                              andTag:MAINSCENE_START_BUTTON ];
    
    CCMenu *hudMenu = [CCMenu menuWithItems:nil];
    
    [hudMenu addChild:startButton];
    
    hudMenu.position = ccp( size.width * START_X_OFFSET_FACTOR
                          , size.height * START_Y_OFFSET_FACTOR);
    
    [self addChild: hudMenu z:10];
}

@end
