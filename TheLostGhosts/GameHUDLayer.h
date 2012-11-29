//
//  GameHUDLayer.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "CCLayer.h"
#import "GameScene.h"

@interface GameHUDLayer : CCLayer {
    GameScene *parent;
}

-(id)initWithParent:(GameScene *)parent;

@end
