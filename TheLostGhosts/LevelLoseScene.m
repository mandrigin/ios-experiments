//
//  LevelLoseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "LevelLoseScene.h"
#import "cocos2d.h"

@implementation LevelLoseScene


-(id) init {
    self = [super init];
    if(self != nil) {
        // ask director for the window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background = [CCSprite spriteWithFile:@"level_lose_fun_town.png"];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
    }
    return self;
}

@end
