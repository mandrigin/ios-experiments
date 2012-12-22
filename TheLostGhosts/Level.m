//
//  Level.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "Level.h"
#import "DataStorage.h"

@implementation Level
@synthesize skin = _skin;
@synthesize number = _number;
@synthesize roundFactories = _roundFactories;
@synthesize currentRoundNumber = _currentRoundNumber;
@synthesize state = _state;


-(id)init {
    self = [super init];
    if (self != nil) {
        _roundFactories = [[NSMutableArray alloc] init];
        _skin = nil;
    }
    return self;
}

-(void) addRoundWithGhosts:(int)numOfGhosts
                   badMans:(int)numOfBadmans
               previewTime:(long)previewTime
                 levelTime:(long)levelTime
                  training:(bool)training {
    [[self roundFactories] addObject:[RoundFactory createWithGhosts:numOfGhosts
                                                      badMans:numOfBadmans
                                                  previewTime:previewTime
                                                    levelTime:levelTime
                                                     training:training
                                                    andLayout:[self skin]]];
}


-(RoundFactory *)getCurrentRound {
    return [[self roundFactories] objectAtIndex:_currentRoundNumber];
}

-(bool) hasMoreRounds {
    return [[self roundFactories] count] > (_currentRoundNumber + 1);
}

-(void) gotoNextRound {
    _currentRoundNumber++;
}

-(void) saveToStorage:(DataStorage *)storage withWorldNumber:(int)worldNumber {
    [storage saveLevelState:[self state] forLevelNumber:_number withWorldNumber:worldNumber];
}

-(void) loadFromStorage:(DataStorage *)storage  withWorldNumber:(int)worldNumber {
    [self setState:[storage loadLevelState:_number withWorldNumber:worldNumber]];
}

-(void)markPassed {
    [self setState:PASSED];
}

-(void)markEnabled {
    [self setState:ENABLED];
}

-(NSString*) getIcon {
    
    switch (_state) {
        case LOCKED:
            return [[self skin] lockedLevelIcon];
            
        case PASSED:
            return [[self skin]  passedLevelIcon];
            
        case ENABLED:
            return [[self skin]  enabledLevelIcon];
        
        default:
            return [[self skin]  enabledLevelIcon];
    }
}

-(void) setNumber:(int)number {
    _number = number;
}

-(bool) addedToSomeWorld {
    return _skin != nil;
}

//PRIVATE
-(void)dealloc {
    [_roundFactories release];
    [_skin release];
    [super dealloc];
}

@end
