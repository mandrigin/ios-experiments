//
//  LevelStorage.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelStorage.h"
#import "World.h"
#import "LevelState.h"
#import "Game.h"

@interface LevelStorage() 
    -(void)createSkins;
    -(void)createLevels;
    -(void)dealloc;
@end

@implementation LevelStorage

+(id)create {
    return [[LevelStorage alloc] init];
}

-(id)init {
    self = [super init];
    if(self != nil) {
        
        _currentWorldNumber = 0;
        _worlds             = [[NSMutableArray alloc] init];
        
        [self createSkins];
        [self createLevels];
    }
    return self;
}

-(void) loadFromStorage:(id)dataStorage {
    
}

-(void) saveToStorage:(id)dataStorage {
    
}

-(NSArray *)getWorlds {
    return _worlds;
}

-(bool) hasNextWorld {
    return [_worlds count] > _currentWorldNumber + 1;
}

-(bool) hasPrevWorld {
    return _currentWorldNumber > 0;
}

-(void) gotoNextWorld {
    _currentWorldNumber++;
}

-(void) gotoPrevWorld {
    _currentWorldNumber--;
}

-(void) setCurrentWorldByNumber:(int)number {
    _currentWorldNumber = number;
}

-(World *) getCurrentWorld {
    return [_worlds objectAtIndex:_currentWorldNumber];
}

//PRIVATE METHODS

-(void)createSkins {
    // TODO_DAN: добавить картинки и добавить соответствующие свойства в WorldSkin.
    //           В этой строчке кода не хватает некоторых параметров в конструкторе worldskin
    //           Собственно, за описанием элементов -- тоже хорошо бы в worldskin залезть.
    
    _funTownSkin = [WorldSkin createWithTopMargin:5.0f
                                     bottomMargin:6.0f
                                 horizontalMargin:8.7f
                                             rows:4
                                          columns:5
                                    windowCorrect:@"wnd_fun_town_correct.png"
                                  windowFailEmpty:@"wnd_fun_town_fail_empty.png"
                                  windowFailGhost:@"wnd_fun_town_fail_ghost.png"
                                 windowFailBadman:@"wnd_fun_town_fail_badman.png"
                               windowPreviewGhost:@"wnd_fun_town_preview_ghost.png"
                              windowPreviewBadman:@"wnd_fun_town_preview_badman.png"
                                   windowSelected:@"wnd_fun_town_selected.png"
                                     windowNormal:@"wnd_fun_town_normal.png" 
                                  lockedLevelIcon:@"lc_house_malinki_disabled.png"
                                  passedLevelIcon:@"lc_house_malinki_passed.png"
                                 enabledLevelIcon:@"lc_house_malinki_enabled.png"
                                     worldCaption:@"caption_malinki.png"
                               levelChooseSceneBg:@"level_choose_malinki_back.png"];
}

-(void)createLevels {
    // TODO_DAN: создать один мир, добавить его в _worlds, в мире должно быть 2 level-a в каждом -- по 2 round-а
    World* world = [[World alloc] initWithSkin: _funTownSkin];

    for (int j = 0; j < 16; j++) {
        Level* level = [[Level alloc]init];
        [level addRoundWithGhosts:3 badMans:2 previewTime:2 levelTime:1000 training:NO];
        [level setState: ENABLED];
        [world addLevel: level];
    }

    [_worlds addObject:world];
}

-(void)dealloc {
    [_funTownSkin release];
    
    for (id world in _worlds) {
        [world release];
    }
    
    [_worlds release];
    [super dealloc];
    
}




@end
