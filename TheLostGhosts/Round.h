//
//  Level.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "RoundSettings.h"

@interface Round : NSObject {
    RoundSettings* _settings;
    NSArray*       _playground;
}

-(id) initWithSettings:(RoundSettings *)settings;

-(RoundSettings *) getSettings;

-(NSArray *) getPlayground;

@end
