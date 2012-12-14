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
#import "Level.h"
#import "Graphics.h"
#import "Sounds.h"

@interface Game : NSObject {
    
    int currentLevelIndex;
    
    Graphics     * _graphics;
    Sounds       * _sounds;
    LevelStorage * _storage;
    
}

@property (readonly) LevelStorage *storage;

+(Game *) sharedGame;

-(Graphics *)getGraphics;

-(bool)hasNextLevel;

-(bool)hasNextRound;

-(bool)gotoNextRound;

-(bool)gotoNextLevel;

-(bool)isLastLevel;

-(bool)loadLevelToTheGameScene:(Level *)level;

@end
