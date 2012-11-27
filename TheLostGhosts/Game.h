//
//  Game.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelStorage.h"
#import "Level.h"

@interface Game : NSObject {
    int currentLevelIndex;
}

@property (readonly) LevelStorage *storage;

+(Game *) sharedGame;

-(Level *)createCurrentLevel;

@end
