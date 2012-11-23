//
//  GhostyWindow.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindow.h"

@implementation GhostyWindow

+(id) create:(GhostyWindowState)state {
    
    self = [super
                itemFromNormalImage:@"wnd_fun_town_normal.png"
                selectedImage:@"wnd_fun_town_normal.png"
                block:^(id sender) {
                        GhostyWindowState *item = (GhostyWindowState*)sender;
                        if(![item isSelected]) {
                            [item setWindowImage:@"wnd_fun_town_selected.png"];
                            [item setSelected:YES];
                        } else {
                            [item setWindowImage:@"wnd_fun_town_normal.png"];
                            [item setSelected:NO];
                        }
                }];
    
    [self setState:state];
    [self showNormalState];
    
    return self;
}


-(void)setWindowImage:(NSString *)imageName {
    [self setNormalImage:[CCSprite spriteWithFile:imageName]];
}

-(void)showNormalState {
    [self setWindowImage:@"wnd_fun_town_normal.png"];
    [self setSelected:NO];
}

-(void)showPreview {
    switch ([self getState]) {
        case kGhost:
            [self setWindowImage:@"wnd_fun_town_preview_ghost.png"];
            break;
            
        case kBadMan:
            [self setWindowImage:@"wnd_fun_town_preview_badman.png"];
            break;
            
        case kEmpty:
            break;
        default:
            break;
    }
}

-(void)showResult {
    if([self isSelected]) {
        switch ([self getState]) {
            case kGhost:
                [self setWindowImage:@"wnd_fun_town_correct.png"];
                break;
            case kBadMan:
                [self setWindowImage:@"wnd_fun_town_fail_badman.png"];
                break;
            case kEmpty:
                [self setWindowImage:@"wnd_fun_town_fail_empty.png"];
                break;
            default:
                break;
        }
    } else {
        if([self getState] == kGhost) {
            [self setWindowImage:@"wnd_fun_town_fail_ghost.png"];
        }
    }
}

@end
