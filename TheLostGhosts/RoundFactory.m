//
//  LevelFactory.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "RoundFactory.h"
#import "Round.h"

@implementation RoundFactory

-(id)initWithSettings:(RoundSettings *)settings {
    self = [super init];
    
    if(self != nil) {
        self->_settings = settings;
    }
    
    return self;
}

+(id)createWithSettings:(RoundSettings *)settings {
    return [[[RoundFactory alloc] initWithSettings:settings] autorelease];
}

-(Round *) createLevel {
    RoundSettings *settings = self->_settings;
    return [[Round alloc] initWithSettings:settings];
}

@end
