//
//  LevelStorage.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelStorage.h"
#import "RoundFactory.h"
#import "RoundSettings.h"

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
                                     windowNormal:@"wnd_fun_town_normal.png" ];
}

-(void)createLevels {
    [self createFunTown];
}

-(void)dealloc {
    [_funTownSkin release];
    [super dealloc];
    
}




@end
