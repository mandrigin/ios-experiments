//
//  Graphics.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Graphics : NSObject {
    CCScene* rootScene;
    CCLayer* overlayLayer;
}

//overlays
-(void)showPauseOverlay;
-(void)hidePauseOverlay;
-(void)showLevelResultOverlay;
-(void)hideLevelResultOverlay;
-(void)showRoundNumberOverlay;
-(void)hideRoundNumberOverlay;


//scenes
-(void)showGameScene;
-(void)showMainMenuScene;
-(void)showLevelChooseScene;
-(void)showGameWinScene;

-(void)hideCurrentScene;

@end
