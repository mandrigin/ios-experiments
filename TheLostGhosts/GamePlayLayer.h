//
//  GamePlayLayer.h
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "LevelStorage.h"
#import "Level.h"

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
    int numberOfWindowsLeft;
    int previewTime;
    int levelTime;
    int currentTime;
    GameState state;
}

+(id) createWithHeight:(int)height width:(int)width andLevel:(Level *)level;

-(void)start;

@end
