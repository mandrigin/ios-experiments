//
//  GamePauseLayer.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "GamePauseLayer.h"
#import "cocos2d.h"

@implementation GamePauseLayer

-(id) initWithParent:(GameScene*)_parent {
    self = [super init];
    
    self->parent = _parent;
    
    if(self != nil) {
    
            // ask director for the window size
            
        CGSize size = [[CCDirector sharedDirector] winSize];
            
        CCSprite *background;
            
        background = [CCSprite spriteWithFile:@"game_bg_fun_town_pause.png"];
        
        background.position = ccp(size.width/2, size.height/2);
            
        // add the label as a child to this Layer
        [self addChild: background];
        
        CCMenuItemImage *pauseButton = [CCMenuItemImage
                                        itemFromNormalImage:@"img_pause_caption.png"
                                        selectedImage:@"img_pause_caption.png"
                                        
                                        block:^(id sender) {
                                            [parent removeChild:self cleanup:YES];
                                            [[CCDirector sharedDirector] resume];
                                         
                                        }];
        CCMenu *hudMenu = [CCMenu menuWithItems:pauseButton, nil];
        
        hudMenu.position = ccp(size.width / 2, size.height/2.3);
        
        [self addChild: hudMenu z:10];

    
    }
    
    return self;
}

@end
