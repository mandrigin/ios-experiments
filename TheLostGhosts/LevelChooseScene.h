//
//  LevelChooseScene.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "BaseScene.h"
#import "cocos2d.h"

@interface LevelChooseScene : BaseScene {
    CCMenuItemImage* btnPrevWorld;
    CCMenuItemImage* btnNextWorld;
    CCMenu* menuLevels;
}

@end
