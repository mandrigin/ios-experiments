//
//  GamePlayLayer.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"

@interface GamePlayLayer : CCLayer {
    NSMutableArray *windows;
}

+(id) createWithHeight:(int)height andWidth:(int)width;

-(void)start;

@end
