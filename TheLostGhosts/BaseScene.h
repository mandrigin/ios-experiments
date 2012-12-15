//
//  BaseScene.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "CCScene.h"
#import "CCLayer.h"

@interface BaseScene : CCScene {
    CGSize size;
}

-(id) createTouchableSprite:(NSString*)image
                      withTag:(int)tag;

-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                           andTag:(int)tag;


-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                              tag:(int)tag
                       andIntData:(int)data;


-(id)initWithBackground:(CCLayer *)layer;

@end
