//
//  Game.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Game.h"

@implementation Game
@synthesize levelStorage = _levelStorage;


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
        self->_levelStorage = [[LevelStorage alloc] init];
        self->_graphics = [[Graphics alloc] init];
        self->_sounds = [[Sounds alloc] init];
        //
        [self load];
    }
    return self;
}

-(void) load {
    [[self levelStorage]   loadFromStorage];
}

-(void) save {
    [[self levelStorage] saveToStorage];
}

- (World *)getCurrentWorld {
    return [[self levelStorage] getCurrentWorld];
}

- (Round *)getCurrentRound {
    return [[[[[self levelStorage] getCurrentWorld] getCurrentLevel] getCurrentRound] createRound];
}


-(void) dealloc {
    [_graphics release];
    [_sounds release];
    [super dealloc];
}

@end
