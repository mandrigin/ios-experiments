//
//  World.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface World : NSObject {
    
    int _levelNumber;
    NSMutableArray *_levels;
}

@property(readonly, nonatomic, retain) NSString* caption;

-(NSArray *) getLevels;

-(void) setLevelNumber:(int)levelNumber;

-(bool) hasMoreLevels;

-(Level *) getCurrentLevel;

-(void) gotoNextLevel;

-(void) addLevel:(Level *)level;

@end
