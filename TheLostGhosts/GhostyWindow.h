//
//  GhostyWindow.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindowState.h"

@interface GhostyWindow : CCMenuItemImage

@property (getter = isSelected, setter = setSelected:) BOOL selected;

@property (getter = getState, setter = setState:) GhostyWindowState state;

-(void)showPreview;

-(void)showResult;

-(void)showNormalState;

+(id)create:(GhostyWindowState)state;

@end