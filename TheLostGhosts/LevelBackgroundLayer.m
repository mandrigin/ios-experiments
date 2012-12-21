//
//  LevelBackgroundLayer.m
//  TheLostGhosts
//
//  Created by dan dandan on 12/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelBackgroundLayer.h"
#import "cocos2d.h"

@implementation LevelBackgroundLayer

-(id) init {
    self = [super initWithBgImage:@"level_choose_bg.png"];
    return self;
}

-(void) setWorldBack: (NSString *)additionalImage {
    CCSprite* background = [CCSprite spriteWithFile: additionalImage];
    CGSize size = [self contentSize];
    [background setPosition: ccp( size.width / 2
                                , [background contentSize].height / 2)];
    [self addChild: background];
}

-(void) setCaption: (NSString *)captionImage {
    CCSprite*caption = [CCSprite spriteWithFile: captionImage];
    CGSize size = [self contentSize];
    [caption setPosition:ccp( size.width / 2
                            , size.height - [caption contentSize].height / 2)];
    [self addChild:caption];
}


@end