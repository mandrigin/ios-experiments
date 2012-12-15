//
//  World.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "World.h"

@implementation World

-(id)init {
    self = [super init];
    if(self != nil) {
        _levelNumber = 0;
        _levels = [NSMutableArray array];
    }
    return self;
}

-(NSArray *)getLevels {
    return _levels;
}

-(Level *) getCurrentLevel {
    return [_levels objectAtIndex:_levelNumber];
}

-(void) addLevel:(Level *)level {
    [_levels addObject:level];
}

-(bool) hasMoreLevels {
    return [_levels count] > _levelNumber + 1;
}

-(void) gotoNextLevel {
    _levelNumber++;
}

-(void) setLevelNumber:(int)levelNumber {
    _levelNumber = levelNumber;
}

@end
