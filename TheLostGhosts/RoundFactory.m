//
//  LevelFactory.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "RoundFactory.h"

@implementation RoundFactory

-(id)initWithGhosts:(int)numOfGhosts
            badMans:(int)numOfBadmans
        previewTime:(long)previewTime
          levelTime:(long)levelTime
           training:(bool)training
          andLayout:(WorldSkin *) layout {
    
    self = [super init];
    
    if(self != nil) {
        self->_settings = [RoundSettings createWithLayout:layout
                                                   ghosts:numOfGhosts
                                                  badMans:numOfBadmans
                                              previewTime:previewTime
                                                levelTime:levelTime
                                                 training:training];
    }
    
    return self;
}

+(id)createWithGhosts:(int)numOfGhosts
              badMans:(int)numOfBadmans
          previewTime:(long)previewTime
            levelTime:(long)levelTime
             training:(bool)training
            andLayout:(WorldSkin *)layout {
    return [[RoundFactory alloc] initWithGhosts:numOfGhosts
                                        badMans:numOfBadmans
                                    previewTime:previewTime
                                      levelTime:levelTime
                                       training:training
                                      andLayout:layout];
}

-(Round *) createRound {
    RoundSettings *settings = self->_settings;
    return [[Round alloc] initWithSettings:settings];
}


-(void)dealloc {
    [_settings release];
    [super dealloc];
}

@end
