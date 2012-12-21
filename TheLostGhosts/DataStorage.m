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
    int data = [[NSUserDefaults standardUserDefaults] integerForKey:[self keyFromWorld:worldNumber andLevel:number]];
    return (LevelState)data;
}

-(void) saveLevelState:(LevelState)state forLevelNumber:(int)number withWorldNumber:(int)worldNumber {
    [[NSUserDefaults standardUserDefaults] setInteger:state forKey:[self keyFromWorld:worldNumber andLevel:number]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(WorldState) getStateForWorld:(int) worldNumber {
    int data = [[NSUserDefaults standardUserDefaults] integerForKey:[self keyFromWorld:worldNumber]];
    return (WorldState)data;
}

-(NSString *) keyFromWorld:(int)world andLevel:(int)level {
    return [NSString stringWithFormat:@"w%dl%d", world, level];
}

-(NSString *) keyFromWorld:(int)world {
    return [NSString stringWithFormat:@"w%d", world];
}

@end
