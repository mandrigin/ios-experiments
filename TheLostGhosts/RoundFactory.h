//
//  LevelFactory.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelLayout.h"
#import "RoundSettings.h"
#import "Round.h"

@interface RoundFactory : NSObject {
    RoundSettings *_settings;
}

+(id)createWithSettings:(RoundSettings *)settings;

-(Round *) createLevel;

@end
