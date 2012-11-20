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

@implementation GameScene

-(id) init {
    self = [super init];
    
    if(self != nil) {
        GameBackgroundLayer *gameBackgroundLayer = [GameBackgroundLayer node];
        
        [self addChild:gameBackgroundLayer z:0];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        int topMargin = 200;
        int bottomMargin = 50;
        int leftMargin = 30;
        int rightMargin = 30;
        
        GamePlayLayer *gamePlayLayer = [GamePlayLayer alloc];
        gamePlayLayer = [gamePlayLayer initWithSize:(int)size.height - (topMargin + bottomMargin):(int)size.width - (leftMargin + rightMargin)];
        gamePlayLayer = [gamePlayLayer autorelease];
        
        int x = (leftMargin);
        int y = (bottomMargin);
        
        [gamePlayLayer setPosition:ccp(x, y)];
        
        [self addChild:gamePlayLayer z:5];
        
        GameHUDLayer *gameHudLayer = [GameHUDLayer node];
        
        [self addChild:gameHudLayer z:10];
    }
    
    return self;
}

@end
