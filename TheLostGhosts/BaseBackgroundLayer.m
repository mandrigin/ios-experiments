//
//  BaseBackgroundLayer.m
//  TheLostGhosts
//
//  Created by dan dandan on 12/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseBackgroundLayer.h"

@implementation BaseBackgroundLayer

-(id) initWithBgImage: (NSString *)bgImage {
    self = [super init];
    if(self != nil) {
        // ask director for the window size
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *background;
        
        background = [CCSprite spriteWithFile: bgImage];
        
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
    }
    return self;
}

@end
