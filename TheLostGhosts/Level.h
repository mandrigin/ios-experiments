//
//  Level.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "RoundSettings.h"
#import "RoundFactory.h"
#import <Foundation/Foundation.h>

typedef enum {
    LOCKED = 1,
    ENABLED = 2,
    PASSED = 3
} LevelState;


@interface Level : NSObject {
    LevelState      _state;
    RoundSettings * _settings;
    NSMutableArray* _roundFactories;
    int             _currentRound;
}

+(id) createWithSettings:(RoundSettings *)settings;

-(NSString *) getLevelIcon;

-(void) setState:(LevelState)newState;

-(void) addRoundFactory;

-(RoundFactory *) getCurrentRoundFactory;

-(bool) hasMoreRounds;

-(void) gotoNextRound;

@end
