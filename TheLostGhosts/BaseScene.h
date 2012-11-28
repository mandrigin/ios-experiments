//
//  BaseScene.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "CCScene.h"

@interface BaseScene : CCScene

-(id) createTouchableSprite:(NSString*)image
                      withCallback:(void(^)()) callback;

@end
