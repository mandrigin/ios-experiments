//
//  Graphics.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Graphics.h"
#import "GamePauseLayer.h"
#import "GameScene.h"

@implementation Graphics

-(void) showPauseOverlay {
    if(rootScene != nil && overlayLayer == nil) {
        overlayLayer = [[GamePauseLayer alloc] init];
    
        [rootScene addChild:overlayLayer z:INT16_MAX];
    }
}

-(void) hidePauseOverlay {
    if(rootScene != nil && overlayLayer != nil) {
        [rootScene removeChild:overlayLayer cleanup:NO];
        
        [overlayLayer release];
        
        overlayLayer = nil;
    }
}

-(void) showGameScene {
    [self replaceScene:[[GameScene alloc] init]];
}


-(void) replaceScene:(CCScene*)scene {
    [self hideCurrentScene];
    
    [[CCDirector sharedDirector] replaceScene:scene];
    
    rootScene = scene;
}

-(void) hideCurrentScene {
    if(rootScene != nil) {
        [rootScene release];
        
        rootScene = nil;
    }
}

@end
