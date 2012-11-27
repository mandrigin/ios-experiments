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
        
        int topMargin    = 200;
        int bottomMargin = 50;
        int leftMargin   = 30;
        int rightMargin  = 30;
        
        Level *currentLevel = [[Game sharedGame] createCurrentLevel];
        GamePlayLayer *gamePlayLayer = [GamePlayLayer createWithHeight: (int)size.height - (topMargin + bottomMargin)
                                                                 width: (int)size.width - (leftMargin + rightMargin)
                                                              andLevel: currentLevel];
        
        int x = (leftMargin);
        int y = (bottomMargin);
        
        [gamePlayLayer setPosition:ccp(x, y)];
        
        [self addChild:gamePlayLayer z:5];
        
        GameHUDLayer *gameHudLayer = [GameHUDLayer node];
        
        [self addChild:gameHudLayer z:10];
        
        [gamePlayLayer start];
    }
    
    return self;
}

@end
