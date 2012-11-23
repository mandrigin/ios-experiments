//
//  LevelFactory.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelLayout.h"
#import "LevelSettings.h"
#import "Level.h"

@interface LevelFactory : NSObject {
    LevelSettings *_settings;
}

+(id)createWithSettings:(LevelSettings *)settings;

-(Level *) createLevel;

@end
