//
//  DataStorage.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelState.h"
#import "WorldState.h"

@interface DataStorage : NSObject

-(LevelState) loadLevelState:(int)number withWorldNumber:(int)worldNumber;

-(void) saveLevelState:(LevelState)state forLevelNumber:(int)number withWorldNumber:(int)worldNumber;

-(WorldState) getStateForWorld:(int) worldNumber;

-(void) saveWorldState: (WorldState)state forWorldNumber:(int)worldNumber;

@end
