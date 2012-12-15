//
//  Events.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

+(void)onClickTaggedItem:(int)tag;

+(void)onClickTaggedItem:(int)tag withIntData:(int)data;


@end
