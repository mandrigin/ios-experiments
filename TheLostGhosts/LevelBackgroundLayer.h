//
//  LevelBackgroundLayer.h
//  TheLostGhosts
//
//  Created by dan dandan on 12/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseBackgroundLayer.h"
#import "cocos2d.h"

@interface LevelBackgroundLayer : BaseBackgroundLayer

    -(void)setWorldShadow: (NSString *)additionalImage;

- (void)setCaption:(NSString *)captionImage;


@end
