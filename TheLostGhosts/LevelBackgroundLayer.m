//
//  LevelBackgroundLayer.m
//  TheLostGhosts
//
//  Created by dan dandan on 12/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelBackgroundLayer.h"

@implementation LevelBackgroundLayer

-(id) init {
    self = [super initWithBgImage:@"level_choose_bg.png"];
    return self;
}

-(void) setWorldBack: (NSString *)additionalImage {
    CCSprite* background = [CCSprite spriteWithFile: additionalImage];
    [self addChild: background];
}


@end