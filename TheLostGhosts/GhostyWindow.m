//
//  GhostyWindow.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/20/12.
//
//

#import "cocos2d.h"
#import "GhostyWindow.h"
#import "LevelLayout.h"

@implementation GhostyWindow

+(id) createWithState:(GhostyWindowState)state layout:(LevelLayout *)layout andCallback:(void(^)(GhostyWindow* sender))callback; {
    
    GhostyWindow *window = [GhostyWindow itemFromNormalImage:[layout windowNormal]
                                               selectedImage:[layout windowNormal]
                                                       block:^(id sender) {
                                                           GhostyWindow *item = (GhostyWindow*)sender;
                                                           [item toggleWindowSelection];
                                                           callback(item);
                                                       }];
    
    [window setState:state];
    [window setLayout:layout];
    
    [window showNormalState];
    
    return window;
}

-(void)setLayout:(LevelLayout *)layout {
    self->_layout = layout;
}


-(void)setWindowImage:(NSString *)imageName {
    [self setNormalImage:[CCSprite spriteWithFile:imageName]];
}

-(void)showNormalState {
    [self setWindowImage:[self->_layout windowNormal]];
    [self setSelected:NO];
}

-(void) selectWindow {
    [self setSelected:YES];
    [self setWindowImage:[self->_layout windowSelected]];
}

-(void) deselectWindow {
    [self setSelected:NO];
    [self setWindowImage:[self->_layout windowNormal]];
}

-(void)toggleWindowSelection {
    if([self isSelected]) {
        [self deselectWindow];
    } else {
        [self selectWindow];
    }
}

-(void)showPreview {
    switch ([self getState]) {
        case kGhost:
            [self setWindowImage:[self->_layout windowPreviewGhost]];
            break;
            
        case kBadMan:
            [self setWindowImage:[self->_layout windowPreviewBadMan]];
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
                [self setWindowImage:[self->_layout windowCorrect]];
                break;
            case kBadMan:
                [self setWindowImage:[self->_layout windowFailBadMan]];
                break;
            case kEmpty:
                [self setWindowImage:[self->_layout windowFailEmpty]];
                break;
            default:
                break;
        }
    } else {
        if([self getState] == kGhost) {
            [self setWindowImage:[self->_layout windowFailEmpty]];
        }
    }
}

-(bool) isCorrect {
    return ([self isSelected] && [self getState] == kGhost) || (!([self isSelected]) && [self getState] != kGhost);
}

@end
