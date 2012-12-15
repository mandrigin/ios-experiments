//
//  World.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 12/14/12.
//
//

#import <Foundation/Foundation.h>

@interface World : NSObject

@property(readonly, nonatomic, retain) NSString* caption;

@property(readonly, nonatomic, retain) NSArray* levels;

-(void)setLevelNumber:(int)levelNumber;

@end
