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
@end
