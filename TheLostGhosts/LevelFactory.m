//
//  LevelFactory.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelFactory.h"
#import "Level.h"

@implementation LevelFactory

-(id)initWithSettings:(LevelSettings *)settings {
    self = [super init];
    
    if(self != nil) {
        self->_settings = settings;
    }
    
    return self;
}

+(id)createWithSettings:(LevelSettings *)settings {
    return [[[LevelFactory alloc] initWithSettings:settings] autorelease];
}

-(Level *) createLevel {
    LevelSettings *settings = self->_settings;
    return [[Level alloc] initWithSettings:settings];
}

@end
