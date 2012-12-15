//
//  BaseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "BaseScene.h"
#import "cocos2d.h"
#import "Events.h"

@implementation BaseScene

-(id)initWithBackground:(CCLayer *)layer {
    self = [super init];
    
    if(self != nil) {
        [self addChild: layer];
    }
    
    return self;
}

-(void)onEnter {
    [super onEnter];
    
    size = [[CCDirector sharedDirector] winSize];
}

-(id) createButton:(NSString *)normalImage
     selectedImage:(NSString *)selectedImage
             block:(void(^)()) callback {
    
    return [CCMenuItemImage itemFromNormalImage:normalImage
                           selectedImage:selectedImage
                                          block:^(id sender) {
                                              callback();
                                          }];
    
}

-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                              tag:(int)tag
                       andIntData:(int)data {
    return [self createButton:normalImage
                selectedImage:selectedImage
                        block:^{
                            [Events onClickTaggedItem:tag withIntData:data];
                        }];
}

-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                           andTag:(int)tag {
    
    return [self createButton:normalImage
                selectedImage:selectedImage
                        block:^{
                            [Events onClickTaggedItem:tag];
                        }];
}





-(id) createTouchableSprite:(NSString*)image
               withTag:(int)tag {
    return [self createButtonFromNormalImage:image selectedImage:image andTag:tag];
}


@end
