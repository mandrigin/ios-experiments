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

-(id) createButtonFromNormalImage:(NSString *)normalImage
                    selectedImage:(NSString *)selectedImage
                           andTag:(int)tag {
 
    return [CCMenuItemImage itemFromNormalImage:@"btn_start_normal.png"
                                  selectedImage:@"btn_start_pressed.png"     
                                          block:^(id sender) {
                                              [Events onClickTaggedItem:tag];
         
                                          }];
}



-(id) createTouchableSprite:(NSString*)image
               withTag:(int)tag {
    return [self createButtonFromNormalImage:image selectedImage:image andTag:tag];
}


@end
