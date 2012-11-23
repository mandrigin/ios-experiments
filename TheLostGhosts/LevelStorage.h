//
//  LevelStorage.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "LevelLayout.h"

@interface LevelStorage : NSObject {
    LevelLayout    *funTownLevelLayout;
    NSMutableArray *funTownLevels;
}

+(id) create;

-(NSMutableArray *)getFunTownLevels;

@end
