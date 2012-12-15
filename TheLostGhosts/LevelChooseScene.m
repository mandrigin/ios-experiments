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

@implementation LevelChooseScene

-(id)init {
    return [super initWithBackground:[DefaulBackgroundLayer node]];
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
    
    [worldChooseMenu alignItemsHorizontallyWithPadding:size.width * WORLDCHOOSE_MENU_PADDING_FACTOR];
    
    worldChooseMenu.position = ccp(size.width * WORLDCHOOSE_X_OFFSET_FACTOR, size.height * WORLDCHOOSE_Y_OFFSET_FACTOR);
    
    [self addChild:worldChooseMenu];
}

-(void)showCurrentWorld {
    World* currentWorld = [[Game sharedGame] getCurrentWorld];
    
    btnNextWorld.isEnabled = [[Game sharedGame] hasNextWorld];
    btnPrevWorld.isEnabled = [[Game sharedGame] hasPrevWorld];

    [self showCaption:[currentWorld caption]];
    
    [self showLevels:[currentWorld levels]];
}

-(void)showCaption:(NSString *)caption {
    
}

-(void)showLevels:(NSArray *)levelsArray {
    
    CCMenu* oldLevels = menuLevels;
    
    CCMenu* menu = [CCMenu menuWithItems:nil];
    int levelIndex = 0;
    for (Level *level in levelsArray) {
        [menu addChild:[self createButtonFromNormalImage:[level icon]
                                           selectedImage:[level icon]
                                                     tag:LEVCHOOSE_LEVEL_ICON
                                              andIntData:levelIndex]];
        
        levelIndex++;
    }
    
    NSNumber* numOfCols = [NSNumber numberWithInt:4];
    
    [menu alignItemsInRows: numOfCols, numOfCols, numOfCols, numOfCols, nil];
}

@end
