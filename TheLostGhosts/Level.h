//
//  Level.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelSettings.h"

@interface Level : NSObject {
    LevelSettings* _settings;
    NSArray*       _playground;
}

-(id) initWithSettings:(LevelSettings *)factory;

-(LevelSettings *)getSettings;

-(NSArray *)getPlayground;

@end
