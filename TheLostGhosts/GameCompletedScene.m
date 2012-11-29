//
//  GameCompletedScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "GameCompletedScene.h"
#import "MainMenuScene.h"
#import "cocos2d.h"

@implementation GameCompletedScene

-(id) init {
    self = [super init];
    if(self != nil) {
        // ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [self createTouchableSprite:@"game_completed.png" withCallback:^{
            [[CCDirector sharedDirector] replaceScene:[MainMenuScene node]];
        }];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
    }
    return self;
}

@end
