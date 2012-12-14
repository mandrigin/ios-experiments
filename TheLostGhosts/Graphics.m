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
#import "MainMenuScene.h"
#import "LevelChooseScene.h"

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

-(void) showLevelChooseScene {
    [self replaceScene:[[LevelChooseScene alloc] init]];
}

-(void) showGameScene {
    [self replaceScene:[[GameScene alloc] init]];
}

-(void)showMainMenuScene {
    [self replaceScene:[[MainMenuScene alloc] init]];
}


-(void) replaceScene:(CCScene*)scene {
    [self hideCurrentScene];
    
    if([[CCDirector sharedDirector] runningScene] != nil) {
        [[CCDirector sharedDirector] replaceScene:scene];
        
    } else {
        [[CCDirector sharedDirector] pushScene:scene];
    }
    
    rootScene = scene;
}

-(void) hideCurrentScene {
    if(rootScene != nil) {
        [rootScene release];
        
        rootScene = nil;
    }
}

@end
