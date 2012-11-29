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
    
	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];
    
	CCSprite *background = [CCSprite spriteWithFile:@"default_bg_back.png"];
	
    background.position = ccp(size.width/2, size.height/2);
    
	// add the label as a child to this Layer
	[self addChild: background];

	CCSprite *backgroundStars = [CCSprite spriteWithFile:@"default_bg_stars.png"];
	
    backgroundStars.position = ccp(size.width/2, size.height/2);
    
	// add the label as a child to this Layer
	[self addChild: backgroundStars];

}

@end
