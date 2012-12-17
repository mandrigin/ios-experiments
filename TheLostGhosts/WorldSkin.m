//
//  LevelLayout.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "WorldSkin.h"


@implementation WorldSkin

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
    
    WorldSkin *layout = [[WorldSkin alloc] initWithTopMargin:topM
                                                    bottomMargin:bottomM
                                                horizontalMargin:horizontalM
                                                            rows:rows
                                                         columns:cols
                                                   windowCorrect:wCorrect
                                                 windowFailEmpty:wFailEmpty
                                                 windowFailGhost:wFailGhost
                                                windowFailBadman:wFailBadman
                                              windowPreviewGhost:wPreviewGhost
                                             windowPreviewBadman:wPreviewBadMan
                                                  windowSelected:wSelected
                                                    windowNormal:wNormal];
    
        
    return layout;
}

-(id)initWithTopMargin:(float)topM
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
    self = [super init];
    
    if(self != nil) {
        
        _windowCorrect = [wCorrect retain];
        _windowFailEmpty = [wFailEmpty retain];
        _windowFailGhost = [wFailGhost retain];
        _windowFailBadMan = [wFailBadman retain];
        _windowPreviewGhost = [wPreviewGhost retain];
        _windowPreviewBadMan = [wPreviewBadMan retain];
        _windowSelected = [wSelected retain];
        _windowNormal = [wNormal retain];
        
        [self setTopMarginFactor:topM];
        [self setBottomMarginFactor:bottomM];
        [self setHorizontalMarginFactor:horizontalM];
        [self setRows:rows];
        [self setColumns:cols];
    }
    
    return self;
}

@end
