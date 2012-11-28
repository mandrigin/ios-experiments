//
//  Game.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Game.h"
#import "LevelFactory.h"

@implementation Game

Game *_singletonInst;

+(Game *) sharedGame {
    @synchronized([Game class]) {
        if(!_singletonInst) {
            _singletonInst = [[Game alloc] init];
        }
        
        return _singletonInst;
    }
    
    return nil;
}

@synthesize storage = _storage;

-(id) init {
    self = [super init];
    if(self != nil) {
        self->_storage = [LevelStorage create];
        self->currentLevelIndex = 0;
    }
    return self;
}

-(Level *)createCurrentLevel {
    LevelFactory *factory = [[self->_storage getFunTownLevels] objectAtIndex:self->currentLevelIndex];
    return [factory createLevel];
}

-(bool)isLastLevel {
    return self->currentLevelIndex ==  [[self->_storage getFunTownLevels] count] - 1;
}

-(void)incrementLevel {
    self->currentLevelIndex++;
}

-(void) dealloc {
    [_storage release];
    [super dealloc];
}

@end
