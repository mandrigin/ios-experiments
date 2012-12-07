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

-(void)showPauseOverlay;
-(void)hidePauseOverlay;

-(void)showGameScene;
-(void)showMainMenuScene;

-(void)hideCurrentScene;

@end
