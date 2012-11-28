//
//  LevelWinScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "LevelWinScene.h"
#import "cocos2d.h"
#import "Game.h"
#import "GameScene.h"

@implementation LevelWinScene

-(id) init {
    self = [super init];
    if(self != nil) {
        // ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [self createTouchableSprite:@"level_win_fun_town.png"
                                              withCallback:^() {
                                                  [[Game sharedGame] incrementLevel];
                                                  [[CCDirector sharedDirector] replaceScene:[GameScene node]];
                                              }];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
    }
    return self;
}

@end
