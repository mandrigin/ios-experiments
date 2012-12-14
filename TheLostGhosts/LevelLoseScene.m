//
//  LevelLoseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "LevelLoseScene.h"
#import "GameScene.h"
#import "cocos2d.h"

@implementation LevelLoseScene


-(id) init {
    self = [super init];
    if(self != nil) {
        
        CCSprite *background = [self createTouchableSprite:@"level_lose_fun_town.png" withCallback:^{
            [[CCDirector sharedDirector] replaceScene:[GameScene node]];
        }];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
    }
    return self;
}

@end
