//
//  BaseScene.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "CCScene.h"
#import "CCLayer.h"

@interface BaseScene : CCScene

-(id) createTouchableSprite:(NSString*)image
                      withTag:(int)tag;

-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                           andTag:(int)tag;

-(id)initWithBackground:(CCLayer *)layer;

@end
