//
//  LevelSettings.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "WorldSkin.h"

@interface RoundSettings : NSObject{

    @private
        int _numOfBadMans;
        int _numOfGhosts;
        bool _training;
        long _previewTime;
        long _levelTime;

    WorldSkin *levelLayout;
}

@property int numOfBadMans;

@property int numOfGhosts;

@property(setter = isTraining:) bool training;

@property long previewTime;

@property long levelTime;

-(WorldSkin *) getLayout;


+(id) createWithLayout:(WorldSkin*)layout
                ghosts:(int)numOfGhosts
               badMans:(int)numOfBadmans
           previewTime:(long)previewTime
             levelTime:(long)levelTime
              training:(bool)training;

@end
