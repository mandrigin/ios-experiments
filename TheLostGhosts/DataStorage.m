//
//  DataStorage.m
//  TheLostGhosts
//
//  Represents the levelStorage for the game data, which should be saved between sessions.
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import "DataStorage.h"

#define NO_DATA_RECEIVED    0
#define DEFAULT_LEVEL_STATE LOCKED
#define DEFAULT_WORLD_STATE AVAILABLE

@implementation DataStorage


-(LevelState) loadLevelState:(int)number withWorldNumber:(int)worldNumber {
    int data = [[NSUserDefaults standardUserDefaults] integerForKey:[self keyFromWorld:worldNumber andLevel:number]];

    if (NO_DATA_RECEIVED == data) {
        return DEFAULT_LEVEL_STATE;
    } else {
        return (LevelState)data;
    }
}

-(void) saveLevelState:(LevelState)state forLevelNumber:(int)number withWorldNumber:(int)worldNumber {
    [[NSUserDefaults standardUserDefaults] setInteger:state forKey:[self keyFromWorld:worldNumber andLevel:number]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(WorldState) getStateForWorld:(int) worldNumber {
    int data = [[NSUserDefaults standardUserDefaults] integerForKey:[self keyFromWorld:worldNumber]];

    if (NO_DATA_RECEIVED == data) {
        return DEFAULT_WORLD_STATE;
    } else {
        return (WorldState)data;
    }
}

- (void)saveWorldState:(WorldState)state forWorldNumber:(int)worldNumber {
    [[NSUserDefaults standardUserDefaults] setInteger:state forKey:[self keyFromWorld:worldNumber]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(NSString *) keyFromWorld:(int)world andLevel:(int)level {
    return [NSString stringWithFormat:@"w%dl%d", world, level];
}

-(NSString *) keyFromWorld:(int)world {
    return [NSString stringWithFormat:@"w%d", world];
}

@end
