//
//  GhostyWindow.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindow.h"

@implementation GhostyWindow

+(id) create {
    
    
    self = [super
                itemFromNormalImage:@"wnd_fun_town_normal.png"
                selectedImage:@"wnd_fun_town_normal.png"
                block:^(id sender) {
                        CCMenuItemImage *item = (CCMenuItemImage*)sender;
                        if(![item isSelected]) {
                            [item setNormalImage:[CCSprite spriteWithFile:@"wnd_fun_town_selected.png"]];
                            [item setSelected:YES];
                        } else {
                            [item setNormalImage:[CCSprite spriteWithFile:@"wnd_fun_town_normal.png"]];
                            [item setSelected:NO];
                        }
                }];
    
    [self setSelected:NO];
    
    return self;
}

@end
