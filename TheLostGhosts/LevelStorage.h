//
//  LevelStorage.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "WorldSkin.h"
#import "World.h"

@interface LevelStorage : NSObject {
    NSMutableArray * _worlds;
    DataStorage    * _dataStorage;
    int              _currentWorldNumber;
    WorldSkin      * _funTownSkin;
}

-(void) loadFromStorage;

-(void) saveToStorage;

-(NSArray *)getWorlds;

-(bool) hasNextWorld;

-(bool) hasPrevWorld;

-(void) gotoNextWorld;

-(void) gotoPrevWorld;

-(void) setCurrentWorldByNumber:(int)number;

-(World *) getCurrentWorld;

+(id) create;

@end
