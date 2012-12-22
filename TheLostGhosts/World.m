//
//  World.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "World.h"
#import "Logger.h"
#import "DataStorage.h"

@implementation World

-(id)initWithSkin:(WorldSkin *)skin {
    self = [super init];
    
    if(self != nil) {
        _currentLevelNumber = 0;
        _levels = [NSMutableArray array];
        _skin = skin;
        _state = UNAVAILABLE;
    }
    
    return self;
}

-(void) loadFromStorage:(DataStorage *)storage {
    
    [self setWorldState:[storage getStateForWorld:_worldNumber]];
    
    for (Level *level in _levels) {
        [level loadFromStorage:storage withWorldNumber:_worldNumber];
    }
    
}

-(void) saveToStorage:(DataStorage *)storage {

    [storage saveWorldState:_state forWorldNumber:_worldNumber];

    for(Level* level in _levels) {
        [level saveToStorage:storage withWorldNumber:_worldNumber];
    }
}

-(NSArray *)getLevels {
    return _levels;
}

-(Level *) getCurrentLevel {
    return [_levels objectAtIndex:_currentLevelNumber];
}

-(bool) hasNextLevel {
    return [_levels count] > _currentLevelNumber + 1;
}

-(void) gotoNextLevel {
    _currentLevelNumber++;
}

-(void) setCurrentLevelByNumber:(int)levelNumber {
    _currentLevelNumber = levelNumber;
}

-(void) addLevel:(Level *)level {
    if(![level addedToSomeWorld]) {
        [level setSkin:_skin];
        [level setNumber:[_levels count]];
        [_levels addObject:level];
    } else {
        [Logger logErrorWithMessage:@"Level is already added to another world! Skipping!"];
    }
}

-(void) setWorldNumber:(int)number {
    _worldNumber = number;
}

-(NSString *) getBackground {
    return [_skin levelChooseSceneBg];
}

-(NSString *) getCaption {
    return [_skin worldCaption];
}

-(WorldState) getWorldState {
    return _state;
}

-(void) setWorldState:(WorldState)state {
    _state = state;
}

@end
