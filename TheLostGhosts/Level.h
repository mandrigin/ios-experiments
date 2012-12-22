//
//  Level.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "RoundFactory.h"
#import <Foundation/Foundation.h>
#import "LevelState.h"
#import "DataStorage.h"



@interface Level : NSObject {
    WorldSkin   *   _skin;
    int             _number;
    LevelState      _state;
    NSMutableArray* _roundFactories;
    int             _currentRoundNumber;
}
@property(nonatomic, retain) WorldSkin *skin;
@property(nonatomic) int number;
@property(nonatomic, retain) NSMutableArray *roundFactories;
@property(nonatomic) int currentRoundNumber;
@property LevelState state;


-(NSArray *) getRounds;

-(void) addRoundWithGhosts:(int)numOfGhosts
                   badMans:(int)numOfBadmans
               previewTime:(long)previewTime
                 levelTime:(long)levelTime
                  training:(bool)training;

-(RoundFactory *) getCurrentRound;

-(bool) hasNextRound;

-(void) gotoNextRound;

-(void) loadFromStorage:(DataStorage *)storage withWorldNumber:(int)worldNumber;

-(void) saveToStorage:(DataStorage *)storage withWorldNumber:(int)worldNumber;

-(void) markPassed;

-(void) markEnabled;

-(NSString *) getIcon;

-(void) setSkin:(WorldSkin *)skin;

-(void) setNumber:(int) number;

-(bool) addedToSomeWorld;

- (LevelState)getState;


@end
