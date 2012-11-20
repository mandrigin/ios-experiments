//
//  GamePlayLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GamePlayLayer.h"
#import "GhostyWindow.h"
#import "cocos2d.h"

#define NUMBER_OF_ROWS 3;
#define NUMBER_OF_COLS 4;

@implementation GamePlayLayer

+(id) createWithSize:(float)height width:(float)width {
    return [[[self alloc] initWithSize:height:width] autorelease];
}

-(id) initWithSize:(int)height :(int)width {
    self = [super init];
    
    if(self != nil) {
        
        int rows = NUMBER_OF_ROWS;
        int cols = NUMBER_OF_COLS;
        
        NSInteger rowHeigth = (int)height / rows;
        NSInteger colWidth  = (int)width  / cols;
        
        int i;
        int j;
        
        int currentX = 0;
        int currentY = 0;
        
        CCMenu *menu = [CCMenu menuWithItems:nil];
        [menu setPosition:ccp(0, 0)];
        
        
        for (i = 0; i < rows; ++i) {
            
            currentY = rowHeigth * i;
            
            for(j = 0; j < cols; ++j) {
                currentX = colWidth * j;
                CCMenuItem *windowSprite = [GhostyWindow create];
                
                CGSize originalSize = [windowSprite contentSize];
                float originalWidth = originalSize.width;
                float originalHeight = originalSize.height;
                float newScaleX = (float)(colWidth) / originalWidth;
                float newScaleY = (float)(rowHeigth) / originalHeight;
                [windowSprite setScaleX:newScaleX];
                [windowSprite setScaleY:newScaleY];
                
                int offsetX = currentX + colWidth / 2;
                int offsetY = currentY + rowHeigth / 2;
                
                [windowSprite setPosition:ccp(offsetX, offsetY)];
                [menu addChild:windowSprite];
                
            }
        }
        //[menu alignItemsVertically];
        //[menu alignItemsInColumns:4, 4, 4, nil];
        [self addChild:menu];
    }
    
    return self;
}

@end
