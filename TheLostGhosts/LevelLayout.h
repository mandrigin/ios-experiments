//
//  LevelLayout.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>

@interface LevelLayout : NSObject

@property float topMarginFactor;

@property float bottomMarginFactor;

@property float horizontalMarginFactor;

@property int   rows;

@property int   columns;

@property(nonatomic, retain) NSString *windowCorrect;

@property(nonatomic, retain) NSString *windowFailEmpty;

@property(nonatomic, retain) NSString *windowFailGhost;

@property(nonatomic, retain) NSString *windowFailBadMan;

@property(nonatomic, retain) NSString *windowPreviewGhost;

@property(nonatomic, retain) NSString *windowPreviewBadMan;

@property(nonatomic, retain) NSString *windowSelected;

@property(nonatomic, retain) NSString *windowNormal;

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
            windowNormal:(NSString *)wNormal;


@end
