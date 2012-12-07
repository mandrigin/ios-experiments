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

-(Graphics *)getGraphics {
    return self->_graphics;
}

-(id) init {
    self = [super init];
    if(self != nil) {
        self->_storage = [LevelStorage create];
        self->currentLevelIndex = 0;
        self->_graphics = [[Graphics alloc] init];
    }
    return self;
}

-(Level *)createCurrentLevel {
    //TODO: fix, this is only for WebReady DEMO!
    self->_storage = [LevelStorage create];
    //END OF FIX
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
    [_graphics release];
    [super dealloc];
}

@end
