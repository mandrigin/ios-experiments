//
//  LevelStorage.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "LevelStorage.h"
#import "LevelFactory.h"
#import "LevelSettings.h"

@implementation LevelStorage

+(id)create {
    return [[LevelStorage alloc] init];
}

-(id)init {
    self = [super init];
    if(self != nil) {
        [self createLayouts];
        [self createLevels];
    }
    return self;
}

-(void)createLayouts {
    funTownLevelLayout = [LevelLayout createWithTopMargin:5.0f
                                             bottomMargin:6.0f
                                         horizontalMargin:8.7f
                                                     rows:4
                                                  columns:5
                                            windowCorrect:@"wnd_fun_town_correct.png"
                                          windowFailEmpty:@"wnd_fun_town_fail_empty.png"
                                          windowFailGhost:@"wnd_fun_town_fail_ghost.png"
                                         windowFailBadman:@"wnd_fun_town_fail_badman.png"
                                       windowPreviewGhost:@"wnd_fun_town_preview_ghost.png"
                                      windowPreviewBadman:@"wnd_fun_town_preview_badman.png"
                                           windowSelected:@"wnd_fun_town_selected.png"
                                             windowNormal:@"wnd_fun_town_normal.png" ];
}

-(void)createLevels {
    [self createFunTown];
}

-(void)createFunTown {
    funTownLevels = [[NSMutableArray alloc] init];
    [self addLevelTo:funTownLevels layout:funTownLevelLayout ghosts:4 badMans:2 previewTime:2 levelTime:5];
    //[self addLevelTo:funTownLevels layout:funTownLevelLayout ghosts:5 badMans:2 previewTime:2 levelTime:5];

}

-(void)addLevelTo:(NSMutableArray*)array
           layout:(LevelLayout *)layout
           ghosts:(int)ghosts
          badMans:(int)badMans
      previewTime:(int) preview
        levelTime:(int)levelTime {
    
    [array addObject:[LevelFactory createWithSettings:[LevelSettings createWithLayout:layout
                                                                               ghosts:ghosts
                                                                              badMans:badMans
                                                                          previewTime:preview
                                                                            levelTime:levelTime]]];
}

-(NSMutableArray *) getFunTownLevels {
    return self->funTownLevels;
}

-(void)dealloc {
    [funTownLevelLayout release];
    [funTownLevels release];
    [super dealloc];
    
}

@end
