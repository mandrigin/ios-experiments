//
//  LevelSettings.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "RoundSettings.h"

@implementation RoundSettings

-(id)initWithLayout:(LevelLayout *)layout {
    self = [super init];
    if(self != nil) {
        self->levelLayout = layout;
    }
    return self;
}

-(LevelLayout *)getLayout {
    return self->levelLayout;
}

+(id) createWithLayout:(LevelLayout *)layout
                ghosts:(int)numOfGhosts
               badMans:(int)numOfBadmans
           previewTime:(long)previewTime
             levelTime:(long)levelTime {
    
    RoundSettings *settings = [[[RoundSettings alloc] initWithLayout:layout] autorelease];
    
    [settings setNumOfGhosts:numOfGhosts];
    [settings setNumOfBadMans:numOfBadmans];
    [settings setPreviewTime:previewTime];
    [settings setLevelTime:levelTime];
    
    settings.training = false;
    
    return settings;
}

+(id) createTrainingWithLayout:(LevelLayout *)layout
                        ghosts:(int)numOfGhosts
                       badMans:(int)numOfBadmans
                   previewTime:(long)previewTime
                     levelTime:(long)levelTime {
    
    RoundSettings *settings = [[[RoundSettings alloc] initWithLayout:layout] autorelease];
    
    [settings setNumOfGhosts:numOfGhosts];
    [settings setNumOfBadMans:numOfBadmans];
    [settings setPreviewTime:previewTime];
    [settings setLevelTime:levelTime];
    
    settings.training = true;
    
    return settings;
}


@end
