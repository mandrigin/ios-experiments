//
//  DefaulBackgroundLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/29/12.
//
//

#import "DefaulBackgroundLayer.h"
#import "cocos2d.h"

@implementation DefaulBackgroundLayer
//
-(void) onEnter
{
	[super onEnter];
    
	CGSize size = [[CCDirector sharedDirector] winSize];
    
	CCSprite *background = [CCSprite spriteWithFile:@"default_bg_back.png"];
	
    background.position = ccp(size.width/2, size.height/2);
    
	[self addChild: background];
}

@end
