//
//  Game.h
//  TheLostGhosts
//
//  Contains the game files
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelStorage.h"
#import "Round.h"
#import "Graphics.h"
#import "Sounds.h"
#import "World.h"

@interface Game : NSObject {
    
    Graphics     * _graphics;
    Sounds       * _sounds;
    LevelStorage * _storage;
    
    DataStorage  * _dataStorage;
    
}

+(Game *) sharedGame;

-(Graphics *)getGraphics;

-(Sounds *)getSounds;

-(void)load;

-(void)save;

-(LevelStorage *)getLevelStorage;

@end
