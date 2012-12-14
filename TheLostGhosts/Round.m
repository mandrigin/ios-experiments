//
//  Level.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "Round.h"
#import "GhostyWindowState.h"

@implementation Round

-(id) initWithSettings:(RoundSettings *)settings {
    self = [super init];
    
    if(self != nil) {
        self->_settings = settings;
        self->_playground = [self createPlaygroundFromSettings:settings];
    }
    
    return self;
}

-(NSArray *)createPlaygroundFromSettings:(RoundSettings *)settting {
    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    LevelLayout *layout = [settting getLayout];
    
    int rows = [layout rows];
    int cols = [layout columns];
    
    int ghosts = [settting numOfGhosts];
    int badMans= [settting numOfBadMans];
    
    for(int i = 0; i < rows * cols; ++i) {
        [result addObject:[NSNumber numberWithInt:(int)kEmpty]];
    }
    
    for(int i = 0; i < ghosts; ++i) {
        bool written = false;
        while(!written) {
            int index = arc4random() % [result count];
            GhostyWindowState state = (GhostyWindowState)[[result objectAtIndex: index] intValue];
            if(state == kEmpty) {
                [result setObject:[NSNumber numberWithInt:(int)kGhost] atIndexedSubscript:index];
                written = true;
            }
        }
    }
    
    for(int i = 0; i < badMans; ++i) {
        bool written = false;
        while(!written) {
            int index = arc4random() % [result count];
            GhostyWindowState state = (GhostyWindowState)[[result objectAtIndex: index] intValue];
            if(state == kEmpty) {
                [result setObject:[NSNumber numberWithInt:(int)kBadMan] atIndexedSubscript:index];
                written = true;
            }
        }
    }
    
    return result;
}

-(NSArray *)getPlayground {
    return self->_playground;
}

-(RoundSettings *)getSettings {
    return self->_settings;
}


-(void)dealloc {
    [_playground release];
    [super dealloc];
}

@end
