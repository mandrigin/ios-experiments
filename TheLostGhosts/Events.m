//
//  Events.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/27/12.
//
//

#import "Events.h"
#import "Game.h"
#import "Tags.h"

@implementation Events

+(void)onClickTaggedItem:(int)tag {
    switch (tag) {
        case MAINSCENE_START_BUTTON:
            [[[Game sharedGame] getGraphics] showLevelChooseScene];
            break;
            
        default:
            break;
    }
}

+(void)onClickTaggedItem:(int)tag withIntData:(int)data {
    switch (tag) {
        case LEVCHOOSE_LEVEL_ICON:
            [[[Game sharedGame] getCurrentWorld] setLevelNumber:data];
            [[[Game sharedGame] getGraphics] showGameScene];
            break;
        default:
            break;
    }
}
@end
