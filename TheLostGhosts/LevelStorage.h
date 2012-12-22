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
    DataStorage    * _dataStorage;
    int              _currentWorldNumber;
    WorldSkin      * _funTownSkin;
    NSMutableArray * _worlds;
}

-(void) loadFromStorage;

-(void) saveToStorage;

-(bool) hasNextWorld;

-(bool) hasPrevWorld;

-(void) gotoNextWorld;

-(void) gotoPrevWorld;

-(void) setCurrentWorldByNumber:(int)number;

-(World *) getCurrentWorld;

+(id)levelStorageCreate;

@end
