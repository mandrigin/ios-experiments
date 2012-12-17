//
//  Level.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "RoundFactory.h"
#import <Foundation/Foundation.h>

typedef enum {
    LOCKED = 1,
    ENABLED = 2,
    PASSED = 3
} LevelState;


@interface Level : NSObject {
    WorldSkin   *   _skin;
    int             _number;
    LevelState      _state;
    NSMutableArray* _roundFactories;
    int             _currentRoundNumber;
}

-(NSArray *) getRounds;

-(void) addRoundWithGhosts:(int)numOfGhosts
                   badMans:(int)numOfBadmans
               previewTime:(long)previewTime
                 levelTime:(long)levelTime
                  training:(bool)training;

-(RoundFactory *) getCurrentRound;

-(bool) hasNextRound;

-(void) gotoNextRound;

-(void) loadFromStorage:(id)storage;

-(void) saveToStorage:(id)storage;

-(void) markPassed;

-(void) markEnabled;

-(NSString *) getIcon;

-(void) setSkin:(WorldSkin *)skin;

-(void) setNumber:(int) number;

-(bool) addedToSomeWorld;

@end
