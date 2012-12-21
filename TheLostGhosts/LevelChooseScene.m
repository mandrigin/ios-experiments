//
//  LevelChooseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "LevelChooseScene.h"
#import "DefaulBackgroundLayer.h"
#import "cocos2d.h"
#import "Tags.h"
#import "LevelChooseSceneLayout.h"
#import "Game.h"
#import "World.h"
#import "Level.h"
#import "LevelBackgroundLayer.h"

@interface LevelChooseScene()
    -(void)showWorldShadow:(NSString *)changeCaption;

- (void)showWorldShadow:(NSString *)worldShadow andWorldCaption:(NSString *)captionImage;

-(void)showLevels:(NSArray *)levelsArray;
    -(void)showCurrentWorld;
@end

@implementation LevelChooseScene {
    LevelBackgroundLayer *_layer;
}

-(id)init {
    _layer = [LevelBackgroundLayer node];
    return [super initWithBackground:_layer];
}

-(void)onEnter {
    [super onEnter];
    
    btnNextWorld = [self createButtonFromNormalImage:@"btn_next_world_normal.png"
                                       selectedImage:@"btn_next_world_pressed.png"
                                              andTag:LEVCHOOSE_NEXT_WORLD_BUTTON];
    
    btnPrevWorld = [self createButtonFromNormalImage:@"btn_prev_world_normal.png"
                                       selectedImage:@"btn_prev_world_pressed.png"
                                              andTag:LEVCHOOSE_PREV_WORLD_BUTTON];
    
    CCMenu *worldChooseMenu = [CCMenu menuWithItems:btnPrevWorld, btnNextWorld, nil];
    
    [worldChooseMenu alignItemsHorizontallyWithPadding:size.width 
                                    * WORLDCHOOSE_MENU_PADDING_FACTOR];
    
    worldChooseMenu.position = ccp( size.width * WORLDCHOOSE_X_OFFSET_FACTOR
                                  , size.height * WORLDCHOOSE_Y_OFFSET_FACTOR);
    [self showCurrentWorld];
    
    [self addChild:worldChooseMenu];
}

-(void)showCurrentWorld {
    LevelStorage* storage = [[Game sharedGame] getLevelStorage];
    World* currentWorld = [storage getCurrentWorld];
    
    btnNextWorld.isEnabled = [storage hasNextWorld];
    btnPrevWorld.isEnabled = [storage hasPrevWorld];

    [self showWorldShadow:[currentWorld getBackground]
          andWorldCaption: [currentWorld getCaption]];
    [self showLevels:[currentWorld getLevels]];
}

-(void)showWorldShadow:(NSString *)worldShadow
       andWorldCaption:(NSString *)captionImage {

    [_layer setWorldShadow: worldShadow];
    [_layer setCaption: captionImage];
}

-(void)showLevels:(NSArray *)levelsArray {
    
    CCMenu* menu = [CCMenu menuWithItems:nil];
    int levelIndex = 0;
    for (Level *level in levelsArray) {
        [menu addChild:[self createButtonFromNormalImage:[level getIcon]
                                           selectedImage:[level getIcon]
                                                     tag:LEVCHOOSE_LEVEL_ICON
                                              andIntData:levelIndex]];
        
        levelIndex++;
    }
    
    NSNumber* numOfCols = [NSNumber numberWithInt:4];
    
    [menu alignItemsInColumns: numOfCols, numOfCols, numOfCols, numOfCols, nil];
    
    [self addChild: menu];
    
}

@end
