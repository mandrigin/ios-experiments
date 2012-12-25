//
//  LevelFactory.m
//  TheLostGhosts
//
//  Created by Igor Mandrigin on 11/23/12.
//
//

#import "RoundFactory.h"

//declaration of private property:
@interface RoundFactory ()

//    if we don't generate this property
//    we must provide this code example for properly
//    assign an settings field in [self initWithGhosts:]
//        textV = _ text=set
//        if (settings != _settings) {
//            [settings retain];
//            [_settings release];
//            _settings = settings;
//        }

    @property(nonatomic, retain) RoundSettings *settings;
@end

@implementation RoundFactory
@synthesize settings = _settings;


-(id)initWithGhosts:(int)numOfGhosts
            badMans:(int)numOfBadmans
        previewTime:(long)previewTime
          levelTime:(long)levelTime
           training:(bool)training
          andLayout:(WorldSkin *) layout {
    
    self = [super init];
    
    if(self != nil) {

        //this call equals [self setSettings:]
        self.settings = [RoundSettings createWithLayout:layout
                                                 ghosts:numOfGhosts
                                                badMans:numOfBadmans
                                            previewTime:previewTime
                                              levelTime:levelTime
                                               training:training];
    }
    
    return self;
}

+(id)createWithGhosts:(int)numOfGhosts
              badMans:(int)numOfBadmans
          previewTime:(long)previewTime
            levelTime:(long)levelTime
             training:(bool)training
            andLayout:(WorldSkin *)layout {
    return [[[RoundFactory alloc] initWithGhosts:numOfGhosts
                                         badMans:numOfBadmans
                                     previewTime:previewTime
                                       levelTime:levelTime
                                        training:training
                                       andLayout:layout] autorelease];
}

-(Round *) createRound {
    RoundSettings *settings = self->_settings;
    return [[Round alloc] initWithSettings:settings];
}

- (void)dealloc {
    [_settings release];
    [super dealloc];
}

@end
