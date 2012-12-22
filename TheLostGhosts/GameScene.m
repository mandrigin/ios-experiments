//
//  GameScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GameScene.h"
#import "GameHUDLayer.h"
#import "GamePlayLayer.h"
#import "Game.h"

@implementation GameScene

-(id) init {
    self = [super init];
    
    if(self != nil) {
        GameBackgroundLayer *gameBackgroundLayer = [GameBackgroundLayer node];
        
        [self addChild:gameBackgroundLayer z:0];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        int topMargin    = 180;
        int bottomMargin = 180;
        int leftMargin   = 120;
        int rightMargin  = 120;
        Round *currentLevel = [[Game sharedGame] getCurrentRound];
        
        
        
        
        GamePlayLayer *gamePlayLayer = [GamePlayLayer createWithHeight:(int) size.height - (topMargin + bottomMargin)
                                                                 width:(int) size.width - (leftMargin + rightMargin)
                                                              andRound:currentLevel];
        
        int x = (leftMargin);
        int y = (bottomMargin);
        
        [gamePlayLayer setPosition:ccp(x, y)];
        
        [self addChild:gamePlayLayer z:5];
        
        GameHUDLayer *gameHudLayer = [[GameHUDLayer alloc] init];
        
        [self addChild:gameHudLayer z:10];
        
        [gamePlayLayer start];
    }
    
    return self;
}

@end
