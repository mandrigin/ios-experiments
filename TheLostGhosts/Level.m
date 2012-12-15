//
//  Level.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "Level.h"
#import "LevelLayout.h"
#import "RoundFactory.h"

@implementation Level

+(id) createWithSettings:(RoundSettings *)settings {
    return [[Level alloc] initWithSettings:settings];
}

-(id)initWithSettings:(RoundSettings *)settings {
    self = [super init];
    if (self != nil) {
        _settings = settings;
        _roundFactories = [NSMutableArray array];
    }
    return self;
}

-(RoundSettings *)getSettings {
    return _settings;
}

-(void) setState:(LevelState)newState {
    _state = newState;
}

-(void) addRoundFactory {
    [_roundFactories addObject:[RoundFactory createWithSettings:[self getSettings]]];
}

-(RoundFactory *)getCurrentRoundFactory {
    return [_roundFactories objectAtIndex:_currentRound];
}

-(bool) hasMoreRounds {
    return [_roundFactories count] > (_currentRound + 1);
}

-(void) gotoNextRound {
    _currentRound++;
}

-(NSString*) getLevelIcon {
    
    //TODO: fill this method
    
    switch (_state) {
        case LOCKED:
            break;
        
        case PASSED:
            
            break;
            
            
        case ENABLED:
            
            
            break;
            
        default:
            break;
    }
}



@end
