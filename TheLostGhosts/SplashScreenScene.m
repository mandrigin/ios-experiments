//
//  SplashScreenScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "SplashScreenScene.h"
#import "IntroLayer.h"
#import "GameScene.h"

@implementation SplashScreenScene

-(id) init {
    self = [super init];
    
    if(self != nil) {
        IntroLayer *introLayer = [IntroLayer node];
        
        [self addChild:introLayer z:0];
        
        // In one second transition to the new scene
        [self scheduleOnce:@selector(makeTransition:) delay:3];
    }
    
    return self;
}


-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameScene node] withColor:ccWHITE]];
}

@end
