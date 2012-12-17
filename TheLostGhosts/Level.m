//
//  Level.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "Level.h"

@implementation Level

+(id) createWithLayout:(WorldSkin *)layout andNumber:(int)number {
    return [[Level alloc] initWithLayout:layout andNumber:number];
}

-(id)initWithLayout:(WorldSkin *)layout andNumber:(int)number {
    self = [super init];
    if (self != nil) {
        _layout = layout;
        _levelNumber = number;
        _roundFactories = [NSMutableArray array];
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
                                                    andLayout:_layout]];
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
    [storage saveLevelState:_state forLevelNumber:_levelNumber];
}

-(void) saveToStorage:(id)storage {
    [self setState:(LevelState)[storage loadLevelState:_levelNumber]];
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
            return [_layout lockedLevelIcon];
            
        case PASSED:
            return [_layout passedLevelIcon];
            
        case ENABLED:
            return [_layout enabledLevelIcon];
        
        default:
            return [_layout enabledLevelIcon];
    }
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
