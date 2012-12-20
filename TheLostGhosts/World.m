//
//  World.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "World.h"
#import "Logger.h"

@implementation World

-(id)initWithSkin:(WorldSkin *)skin {
    self = [super init];
    
    if(self != nil) {
        _currentLevelNumber = 0;
        _levels = [NSMutableArray array];
        _skin = skin;
    }
    
    return self;
}

-(void) loadFromStorage:(id)storage {
    
}

-(void) saveToStorage:(id)storage {
    
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

-(NSString *) getBackground {
    return [_skin levelChooseSceneBg];
}

-(NSString *) getCaption {
    return [_skin worldCaption];
}

-(void) dealloc {
    
    for (id level in _levels) {
        [level release];
    }
    
    [_levels release];
    
    [super dealloc];
}

@end
