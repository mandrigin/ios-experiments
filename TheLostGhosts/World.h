//
//  World.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import <Foundation/Foundation.h>
#import "Level.h"

typedef enum {
      AVAILABLE
    , UNAVAILABLE
} WorldState;

@interface World : NSObject {
    
    WorldState       _state;
    int              _currentLevelNumber;
    NSMutableArray * _levels;
    int              _worldNumber;
    WorldSkin *      _skin;

}

-(void) loadFromStorage:(id)storage;

-(void) saveToStorage:(id)storage;

-(NSArray *) getLevels;

-(Level *) getCurrentLevel;

-(bool) hasNextLevel;

-(void) gotoNextLevel;

-(void) setCurrentLevelByNumber:(int)levelNumber;

-(void) addLevel:(Level *)level;

-(NSString *) getBackground;

-(NSString *) getCaption;

@end
