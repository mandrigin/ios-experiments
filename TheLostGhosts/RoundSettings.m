//
//  LevelSettings.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "RoundSettings.h"

@implementation RoundSettings

@synthesize numOfBadMans = _numOfBadMans;
@synthesize numOfGhosts = _numOfGhosts;
@synthesize training = _training;
@synthesize previewTime = _previewTime;
@synthesize levelTime = _levelTime;


-(id)initWithLayout:(WorldSkin *)layout {
    self = [super init];
    if(self != nil) {
        self->levelLayout = layout;
    }
    return self;
}

-(WorldSkin *)getLayout {
    return self->levelLayout;
}

+(id) createWithLayout:(WorldSkin *)layout
                ghosts:(int)numOfGhosts
               badMans:(int)numOfBadmans
           previewTime:(long)previewTime
             levelTime:(long)levelTime
              training:(bool)training {
    
    RoundSettings *settings = [[[RoundSettings alloc] initWithLayout:layout] autorelease];
    
    [settings setNumOfGhosts:numOfGhosts];
    [settings setNumOfBadMans:numOfBadmans];
    [settings setPreviewTime:previewTime];
    [settings setLevelTime:levelTime];
    
    settings.training = training;
    
    return settings;
}

@end
