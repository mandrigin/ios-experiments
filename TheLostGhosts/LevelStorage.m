//
//  LevelStorage.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelStorage.h"

@interface LevelStorage()
- (void)setCurrentWorldNumber:(int)number;

- (int)getCurrentWorldNumber;

-(void)createSkins;
    -(void)createLevels;
    -(void)dealloc;
@end

@implementation LevelStorage

+(id)levelStorageCreate {
    id newInstance = [[self alloc] init];
    return newInstance;
}

-(id)init {

    self = [super init];
    if(self != nil) {
        
        _currentWorldNumber = 0;
        _worlds = [[NSMutableArray alloc] init];

        _dataStorage        = [[DataStorage alloc] init];

        [self createSkins];
        [self createLevels];
    }
    return self;
}

-(void) loadFromStorage {
    for(World* world in _worlds) {
        [world loadFromStorage:_dataStorage];
    }
}

-(void) saveToStorage {
    for(World* world in _worlds) {
        [world saveToStorage:_dataStorage];
    }
}

-(bool) hasNextWorld {
    return [_worlds count] > [self getCurrentWorldNumber] + 1;
}

-(bool) hasPrevWorld {
    return [self getCurrentWorldNumber] > 0;
}

-(void) gotoNextWorld {
    [self setCurrentWorldNumber: [self getCurrentWorldNumber] + 1];
}

-(void) gotoPrevWorld {
    [self setCurrentWorldNumber: [self getCurrentWorldNumber] - 1];
}

-(World *) getCurrentWorld {
    return [[_worlds objectAtIndex:[self getCurrentWorldNumber]] retain];
}

//PRIVATE METHODS

-(void)setCurrentWorldNumber:(int)number {
    self->_currentWorldNumber = number;
}

-(int)getCurrentWorldNumber {
    return _currentWorldNumber;
}

-(void)createSkins {
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
    World* world = [[World alloc] initWithSkin: _funTownSkin];

    for (int j = 0; j < 16; j++) {
        Level* level = [[Level alloc]init];
        [level addRoundWithGhosts:3 badMans:2 previewTime:2 levelTime:1000 training:NO];
        [level markEnabled];
        [world addLevel: level];
        //[level release];
    }

    [_worlds addObject:world];
    [self saveToStorage];
//    [world release];
}

-(void)dealloc {
    [_funTownSkin release];
    [_dataStorage release];

    [super dealloc];
    
}

@end
