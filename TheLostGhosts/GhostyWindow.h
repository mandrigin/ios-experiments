//
//  GhostyWindow.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindowState.h"
#import "WorldSkin.h"

@interface GhostyWindow : CCMenuItemImage {
    WorldSkin *_layout;
}

@property (getter = isSelected, setter = setSelected:) BOOL selected;

@property (getter = getState, setter = setState:) GhostyWindowState state;

-(void)showPreview;

-(void)showResult;

-(void)showNormalState;

-(void)toggleWindowSelection;

+(id)createWithState:(GhostyWindowState)state layout:(WorldSkin *)layout andCallback:(void(^)(GhostyWindow* sender))callback;

-(void)setLayout:(WorldSkin *)layout;

-(bool)isCorrect;

-(void)selectWindow;

-(void)deselectWindow;

@end