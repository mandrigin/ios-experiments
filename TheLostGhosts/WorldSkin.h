//
//  LevelLayout.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>

//Тут хранится лэйаут и все картинки для какого-то мира.
@interface WorldSkin : NSObject

//Отступы на игровом поле
@property float topMarginFactor;

@property float bottomMarginFactor;

@property float horizontalMarginFactor;

//Количество рядов окошек
@property int   rows;

//Количество колонок окошек
@property int   columns;

//Окно, когда угадал
@property(readonly, nonatomic, retain) NSString *windowCorrect;

//Окно, когда отметил, а оно пустое
@property(readonly, nonatomic, retain) NSString *windowFailEmpty;

//Окно, когда не отметил, а там привидение
@property(readonly, nonatomic, retain) NSString *windowFailGhost;

//Окно, когда отметил а там злой дед
@property(readonly, nonatomic, retain) NSString *windowFailBadMan;

//Окно, которое показывается на preview раунда -- с призраком
@property(readonly, nonatomic, retain) NSString *windowPreviewGhost;

//Окно, которое показывается на preview раунда -- со злым дедом
@property(readonly, nonatomic, retain) NSString *windowPreviewBadMan;

//Окно, выбранное (с галочкой)
@property(readonly, nonatomic, retain) NSString *windowSelected;

//Окно, закрытое
@property(readonly, nonatomic, retain) NSString *windowNormal;

//Икона для сцены выбора уровня -- залоченный уровень
@property(readonly, nonatomic, retain) NSString *lockedLevelIcon;

//Икона для сцены выбора уровня -- пройденный уровень
@property(readonly, nonatomic, retain) NSString *passedLevelIcon;

//Икона для сцены выбора уровня -- доступный уровень (стандартная иконка)
@property(readonly, nonatomic, retain) NSString *enabledLevelIcon;

//Картинка с названием мира "Карамелькино", "Крыжополь" итд
@property(readonly, nonatomic, retain) NSString *worldCaption;

//Картинка-бэкграунд для levelchoosescene (та, которая тенями: карамельки там, листва, итд)
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
