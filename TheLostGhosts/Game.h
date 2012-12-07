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
#import "Graphics.h"

@interface Game : NSObject {
    int currentLevelIndex;
    
    Graphics* _graphics;
}

@property (readonly) LevelStorage *storage;

+(Game *) sharedGame;

-(Level *)createCurrentLevel;

-(Graphics *)getGraphics;

-(bool)isLastLevel;

-(void)incrementLevel;

@end
