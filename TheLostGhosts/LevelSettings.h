//
//  LevelSettings.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelLayout.h"

@interface LevelSettings : NSObject{
    LevelLayout *levelLayout;
}

@property int numOfBadMans;

@property int numOfGhosts;

@property(setter = isTraining:) bool training;

@property long previewTime;

@property long levelTime;

-(LevelLayout *) getLayout;


+(id) createWithLayout:(LevelLayout*)layout
                ghosts:(int)numOfGhosts
               badMans:(int)numOfBadmans
           previewTime:(long)previewTime
             levelTime:(long)levelTime;

+(id) createTrainingWithLayout:(LevelLayout*)layout
                        ghosts:(int)numOfGhosts
                       badMans:(int)numOfBadmans
                   previewTime:(long)previewTime
                     levelTime:(long)levelTime;


@end
