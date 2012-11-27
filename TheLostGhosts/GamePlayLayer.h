//
//  GamePlayLayer.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "LevelStorage.h"

typedef enum {
      kPreview
    , kGame
    , kFinished
} GameState;

typedef enum {
      kRoundWin
    , kRoundLose
    , kRoundLoseBadman
} RoundResult;

@interface GamePlayLayer : CCLayer {
    NSMutableArray *windows;
    LevelStorage *storage;
    int numberOfWindowsLeft;
    int previewTime;
    int levelTime;
    int currentTime;
    GameState state;
}

+(id) createWithHeight:(int)height andWidth:(int)width;

-(void)start;

@end
