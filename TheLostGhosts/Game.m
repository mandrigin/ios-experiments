//
//  Game.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Game.h"

@implementation Game
@synthesize storage = _storage;

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
        self->_storage = [LevelStorage levelStorageCreate];
        self->_graphics = [[Graphics alloc] init];
        self->_sounds = [[Sounds alloc] init];
        //
        [self load];
    }
    return self;
}

-(void) load {
    [_storage loadFromStorage];
}

-(void) save {
    [_storage saveToStorage];
}

-(void) dealloc {
    [_graphics release];
    [_sounds release];
    [super dealloc];
}

@end
