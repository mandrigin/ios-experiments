//
//  Level.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "Level.h"

@implementation Level

-(id)init {
    self = [super init];
    if (self != nil) {
        _roundFactories = [NSMutableArray array];
        _skin = nil;
    }
    return self;
}

-(void) addRoundWithGhosts:(int)numOfGhosts
                   badMans:(int)numOfBadmans
               previewTime:(long)previewTime
                 levelTime:(long)levelTime
                  training:(bool)training {
    [_roundFactories addObject:[RoundFactory createWithGhosts:numOfGhosts
                                                      badMans:numOfBadmans
                                                  previewTime:previewTime
                                                    levelTime:levelTime
                                                     training:training
                                                    andLayout:_skin]];
}


-(RoundFactory *)getCurrentRound {
    return [_roundFactories objectAtIndex:_currentRoundNumber];
}

-(bool) hasMoreRounds {
    return [_roundFactories count] > (_currentRoundNumber + 1);
}

-(void) gotoNextRound {
    _currentRoundNumber++;
}

-(void) loadFromStorage:(id)storage {
    [storage saveLevelState:_state forLevelNumber:_number];
}

-(void) saveToStorage:(id)storage {
    [self setState:(LevelState)[storage loadLevelState:_number]];
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
            return [_skin lockedLevelIcon];
            
        case PASSED:
            return [_skin passedLevelIcon];
            
        case ENABLED:
            return [_skin enabledLevelIcon];
        
        default:
            return [_skin enabledLevelIcon];
    }
}

-(void) setSkin:(WorldSkin *)skin {
    _skin = skin;
}

-(void) setNumber:(int)number {
    _number = number;
}

-(bool) addedToSomeWorld {
    return _skin != nil;
}

//PRIVATE
-(void) setState:(LevelState)newState {
    _state = newState;
}


-(void)dealloc {
    
    for(id factory in _roundFactories) {
        [factory release];
    }
    
    [_roundFactories release];
    
    [super dealloc];
}

@end
