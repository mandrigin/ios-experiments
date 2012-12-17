//
//  LevelStorage.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import <Foundation/Foundation.h>
#import "WorldSkin.h"

@interface LevelStorage : NSObject {
    WorldSkin    *funTownLevelLayout;
    NSMutableArray *funTownLevels;
}

+(id) create;

-(NSMutableArray *)getFunTownLevels;

@end
