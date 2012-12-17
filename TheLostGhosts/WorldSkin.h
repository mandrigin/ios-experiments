//
//  LevelLayout.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>

@interface WorldSkin : NSObject

@property float topMarginFactor;

@property float bottomMarginFactor;

@property float horizontalMarginFactor;

@property int   rows;

@property int   columns;

@property(readonly, nonatomic, retain) NSString *windowCorrect;

@property(readonly, nonatomic, retain) NSString *windowFailEmpty;

@property(readonly, nonatomic, retain) NSString *windowFailGhost;

@property(readonly, nonatomic, retain) NSString *windowFailBadMan;

@property(readonly, nonatomic, retain) NSString *windowPreviewGhost;

@property(readonly, nonatomic, retain) NSString *windowPreviewBadMan;

@property(readonly, nonatomic, retain) NSString *windowSelected;

@property(readonly, nonatomic, retain) NSString *windowNormal;

@property(readonly, nonatomic, retain) NSString *lockedLevelIcon;

@property(readonly, nonatomic, retain) NSString *passedLevelIcon;

@property(readonly, nonatomic, retain) NSString *enabledLevelIcon;

@property(readonly, nonatomic, retain) NSString *worldCaption;

@property(readonly, nonatomic, retain) NSString *levelChooseSceneBg;


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
      levelChooseSceneBg:(NSString *)levelChooseSceneBg;

@end
