//
//  LevelChooseScene.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "LevelChooseScene.h"
#import "DefaulBackgroundLayer.h"
#import "cocos2d.h"
#import "Tags.h"

@implementation LevelChooseScene

-(id)init {
    return [super initWithBackground:[DefaulBackgroundLayer node]];
}

-(void)onEnter {
    [super onEnter];
    
    CCMenuItemImage* nextWorld = [self createButtonFromNormalImage:@"btn_next_world_normal.png"
                                                     selectedImage:@"btn_next_world_pressed.png"
                                                            andTag:LEVCHOOSE_NEXT_WORLD_BUTTON];
    
    CCMenuItemImage* prevWorld = [self createButtonFromNormalImage:@"btn_prev_world_normal.png"
                                                     selectedImage:@"btn_prev_world_pressed.png"
                                                            andTag:LEVCHOOSE_PREV_WORLD_BUTTON];
}
@end
