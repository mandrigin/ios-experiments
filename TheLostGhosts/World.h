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

@property(readonly, nonatomic, retain) NSString* caption;

-(NSArray *) getLevels;

-(void) setLevelNumber:(int)levelNumber;

-(bool) hasMoreLevels;

-(Level *) getCurrentLevel;

-(void) gotoNextLevel;

-(void) addLevel:(Level *)level;

@end
