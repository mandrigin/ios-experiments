//
//  LevelFactory.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "RoundSettings.h"
#import "Round.h"

@interface RoundFactory : NSObject {
    RoundSettings * _settings;
}

+(id)createWithGhosts:(int)numOfGhosts
              badMans:(int)numOfBadmans
          previewTime:(long)previewTime
            levelTime:(long)levelTime
             training:(bool)training
            andLayout:(LevelLayout *)layout;

-(Round *) createRound;

@end
