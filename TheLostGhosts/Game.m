//
//  Game.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Game.h"

@interface Game ()
    @property(nonatomic, retain) LevelStorage *levelStorage;
@end

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
        self.levelStorage = [LevelStorage levelStorageCreate];
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
    Round * result = [[[[[self levelStorage] getCurrentWorld] getCurrentLevel] getCurrentRound] createRound];

    return result;
}


-(void) dealloc {
    [_graphics release];
    [_sounds release];
    [super dealloc];
}

@end
