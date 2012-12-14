//
//  Game.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Game.h"
#import "RoundFactory.h"

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

-(Graphics *)getGraphics {
    return self->_graphics;
}

-(Sounds *)getSounds {
    return self->_sounds;
}

-(id) init {
    self = [super init];
    if(self != nil) {
        self->_storage = [LevelStorage create];
        self->currentLevelIndex = 0;
        self->_graphics = [[Graphics alloc] init];
        self->_sounds = [[Sounds alloc] init];
    }
    return self;
}

-(Round *)createCurrentLevel {
    RoundFactory *factory = [[self->_storage getFunTownLevels] objectAtIndex:self->currentLevelIndex];
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
    [_sounds release];
    [super dealloc];
}

@end
