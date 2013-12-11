//
//  MyCocos2DClass.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 11..
//  Copyright 2013년 sj. All rights reserved.
//

#import "MyCocos2DClass.h"

#import "HelloWorldLayer.h"

@implementation MyCocos2DClass

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MyCocos2DClass *layer = [MyCocos2DClass node];
    [scene addChild: layer];
    
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [CCMenuItemFont setFontSize:18];
        
        CCMenuItemFont *item1 = [CCMenuItemFont itemWithString:@"Fade"
                                                        target:self                                                     selector:@selector(displayNext:)];
        
        CCMenuItemFont *item2 = [CCMenuItemFont itemWithString:@"FlipAngular"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item3 = [CCMenuItemFont itemWithString:@"ShrinkGrow"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item4 = [CCMenuItemFont itemWithString:@"MoveInB"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item5 = [CCMenuItemFont itemWithString:@"MoveInT"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item6 = [CCMenuItemFont itemWithString:@"MoveInL"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item7 = [CCMenuItemFont itemWithString:@"MoveInR"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item8 = [CCMenuItemFont itemWithString:@"FadeTR"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item9 = [CCMenuItemFont itemWithString:@"FadeUp"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item10 = [CCMenuItemFont itemWithString:@"FlipX"
                                                         target:self
                                                       selector:@selector(displayNext:)];
        
        CCMenu *menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5,
                        item6, item7, item8, item9, item10, nil];
        
        [menu setPosition:ccp(size.width/2, size.height/2 + 20)];
        [menu alignItemsVertically];
        
        [menu setOpacity:255];
        
        [menu alignItemsInColumns:
         [NSNumber numberWithUnsignedInt:4],
         [NSNumber numberWithUnsignedInt:2],
         [NSNumber numberWithUnsignedInt:2],
         [NSNumber numberWithUnsignedInt:1],
         [NSNumber numberWithUnsignedInt:1], nil];
        
        [self addChild:menu];
        
        item1.tag = 1001;
        item2.tag = 1002;
        item3.tag = 1003;
        item4.tag = 1004;
        item5.tag = 1005;
        item6.tag = 1006;
        item7.tag = 1007;
        item8.tag = 1008;
        item9.tag = 1009;
        item10.tag = 1010;
    }
    
    return self;
}

-(void)displayNext:(id)sender
{
    switch ([(CCMenuItemFont*)sender tag]) {
        case 1001:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFade transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1002:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFlipAngular transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1003:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionShrinkGrow transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1004:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInB transitionWithDuration:1.0                                                              scene:s1]];
        }
            
            break;
        case 1005:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInT transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1006:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInL transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1007:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInR transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1008:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFadeTR transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1009:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFadeUp transitionWithDuration:1.0                                                              scene:s1]];
        }
            
            break;
        case 1010:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[HelloWorldLayer node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFlipX transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
    }
    
    
}

@end







