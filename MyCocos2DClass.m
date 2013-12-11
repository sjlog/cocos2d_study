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
	if( (self=[super init]) ) {
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"http://www.ljob.co.kr" fontName:@"Marker Felt" fontSize:20];
        
		label.position =  ccp( size.width /2 , size.height/5 );
		[self addChild: label];
        
        CCMenuItemFont *item1 = [CCMenuItemFont itemWithString:@"Tutorials"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item2 = [CCMenuItemFont itemWithString:@"Start Game"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item3 = [CCMenuItemFont itemWithString:@"Option"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item4 = [CCMenuItemFont itemWithString:@"High Score"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenuItemFont *item5 = [CCMenuItemFont itemWithString:@"About"
                                                        target:self
                                                      selector:@selector(displayNext:)];
        
        CCMenu *menu = [CCMenu menuWithItems:item1, item2, item3, item4, item5, nil];
        
        [menu setPosition:ccp(size.width/2, size.height/2 + 20)];
        [menu alignItemsVertically];
        
        [self addChild:menu];
        
        item1.tag = 1001;
        item2.tag = 1002;
        item3.tag = 1003;
        item4.tag = 1004;
        item5.tag = 1005;
        
        //    self.isTouchEnabled = YES;
        
        
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
             replaceScene:[CCTransitionFlipX transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1002:
            
            break;
        case 1003:
            
            break;
        case 1004:
            
            break;
        case 1005:
            
            break;
        default:
            break;
    }
    
    NSLog(@"menu click");
    
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    /*
     id scene = [HelloWorldLayer scene];
     id transition = [CCTransitionRotoZoom transitionWithDuration:1.0f
     scene:scene];
     
     [[CCDirector sharedDirector] replaceScene:transition];
     */
    
    return YES;
}

-(void)registerWithTouchDispatcher{
    
    [[[CCDirector sharedDirector] touchDispatcher]
     addTargetedDelegate:self
     priority:0
     swallowsTouches:YES];
}


@end

