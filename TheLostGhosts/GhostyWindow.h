//
//  GhostyWindow.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindowState.h"
#import "LevelLayout.h"

@interface GhostyWindow : CCMenuItemImage {
    LevelLayout *_layout;
}

@property (getter = isSelected, setter = setSelected:) BOOL selected;

@property (getter = getState, setter = setState:) GhostyWindowState state;

-(void)showPreview;

-(void)showResult;

-(void)showNormalState;

-(void)toggleWindowSelection;

+(id)createWithState:(GhostyWindowState)state layout:(LevelLayout *)layout andCallback:(void(^)(GhostyWindow* sender))callback;

-(void)setLayout:(LevelLayout *)layout;

-(bool)isCorrect;

@end