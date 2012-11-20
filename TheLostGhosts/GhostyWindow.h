//
//  GhostyWindow.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"

typedef enum {
      kNormal
    , kGhost
    , kBadMan
} GhostyWindowState;

@interface GhostyWindow : CCMenuItemImage
{
    GhostyWindowState state;
}

@property (nonatomic, assign, getter = isSelected, setter = setSelected:) BOOL selected;


@end