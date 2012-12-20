//
//  LevelLayout.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "WorldSkin.h"


@implementation WorldSkin {
@private
    int _rows;
    int _columns;
    float _topMarginFactor;
}

@synthesize windowCorrect=_windowCorrect;
@synthesize windowFailBadMan=_windowFailBadMan;
@synthesize windowPreviewGhost=_windowPreviewGhost;
@synthesize windowPreviewBadMan=_windowPreviewBadMan;
@synthesize windowSelected=_windowSelected;
@synthesize windowNormal=_windowNormal;
@synthesize lockedLevelIcon=_lockedLevelIcon;
@synthesize passedLevelIcon=_passedLevelIcon;
@synthesize enabledLevelIcon=_enabledLevelIcon;
@synthesize worldCaption=_worldCaption;
@synthesize levelChooseSceneBg=_levelChooseSceneBg;
@synthesize windowFailGhost=_windowFailGhost;
@synthesize windowFailEmpty=_windowFailEmpty;
@synthesize bottomMarginFactor=_bottomMarginFactor;
@synthesize horizontalMarginFactor=_horizontalMarginFactor;
@synthesize rows = _rows;
@synthesize columns = _columns;
@synthesize topMarginFactor = _topMarginFactor;



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
          windowNormal:(NSString *)wNormal
       lockedLevelIcon:(NSString *)lockedLevelIcon
       passedLevelIcon:(NSString *)passedLevelIcon
      enabledLevelIcon:(NSString *)enabledLevelIcon
          worldCaption:(NSString *)worldCaption
    levelChooseSceneBg:(NSString *)levelChooseSceneBg {
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
        _lockedLevelIcon = [lockedLevelIcon retain];
        _passedLevelIcon = [passedLevelIcon retain];
        _enabledLevelIcon = [enabledLevelIcon retain];
        _worldCaption = [worldCaption retain];
        _levelChooseSceneBg = [levelChooseSceneBg retain];

        [self setTopMarginFactor:topM];
        [self setBottomMarginFactor:bottomM];
        [self setHorizontalMarginFactor:horizontalM];
        [self setRows:rows];
        [self setColumns:cols];
    }

    return self;
}

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
            windowNormal:(NSString *)wNormal
         lockedLevelIcon:(NSString *)lockedLevelIcon
         passedLevelIcon:(NSString *)passedLevelIcon
        enabledLevelIcon:(NSString *)enabeledLevelIcon
            worldCaption:(NSString *)worldCaption
      levelChooseSceneBg:(NSString *)levelChooseSceneBg {
    
    id layout = [[WorldSkin alloc] initWithTopMargin:topM
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
                                                windowNormal:wNormal
                                             lockedLevelIcon:lockedLevelIcon
                                             passedLevelIcon:passedLevelIcon
                                            enabledLevelIcon:enabeledLevelIcon
                                                worldCaption:worldCaption
                                          levelChooseSceneBg:levelChooseSceneBg];

    
    return layout;
}


@end
