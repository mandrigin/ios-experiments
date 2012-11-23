//
//  LevelLayout.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelLayout.h"

@implementation LevelLayout

+(id)createWithTopMargin:(float)topM
            bottomMargin:(float)bottomM
        horizontalMargin:(float)horizontalM
                    rows:(int)rows
                 columns:(int)cols
           windowCorrect:(NSString *)wCorrect
         windowFailEmpty:(NSString *)wFailEmpty
         windowFailGhost:(NSString *)wFailGhost
        windowFailBadman:(NSString *)wFailBadman
      windowPreviewGhost:(NSString *)wPreviewGhost
     windowPreviewBadman:(NSString *)wPreviewBadMan
          windowSelected:(NSString *)wSelected
            windowNormal:(NSString *)wNormal {
    
    LevelLayout *layout = [[LevelLayout alloc] init];
    
    [layout setTopMarginFactor:topM];
    [layout setBottomMarginFactor:bottomM];
    [layout setHorizontalMarginFactor:horizontalM];
    [layout setRows:rows];
    [layout setColumns:cols];
    [layout setWindowCorrect:wCorrect];
    [layout setWindowFailEmpty:wFailEmpty];
    [layout setWindowFailGhost:wFailGhost];
    [layout setWindowFailBadMan:wFailBadman];
    [layout setWindowPreviewGhost:wPreviewGhost];
    [layout setWindowPreviewBadMan:wPreviewBadMan];
    [layout setWindowSelected:wSelected];
    [layout setWindowNormal:wNormal];
    
    return layout;
}


@end
