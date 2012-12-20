//
//  DataStorage.m
//  TheLostGhosts
//
//  Represents the storage for the game data, which should be saved between sessions.
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "DataStorage.h"

@implementation DataStorage

-(LevelState) loadLevelState:(int)number withWorldNumber:(int)worldNumber {
    //TODO: Make real!
    return ENABLED;
}

-(void) saveLevelState:(LevelState)state forLevelNumber:(int)number withWorldNumber:(int)worldNumber {
    //TODO: make real!
}

-(WorldState) getStateForWorld:(int) worldNumber {
    //TODO: make real!
    return AVAILABLE;
}

@end
