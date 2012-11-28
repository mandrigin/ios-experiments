//
//  BaseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "BaseScene.h"
#import "cocos2d.h"

@implementation BaseScene


-(id) createTouchableSprite:(NSString*)image
               withCallback:(void(^)()) callback {
    CCMenuItemImage *pauseButton = [CCMenuItemImage itemFromNormalImage:image
                                                          selectedImage:image
                                                                  block:^(id sender) { callback(); }];
    
    CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];
    return hudMenu;
}


@end
