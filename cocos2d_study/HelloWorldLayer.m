//
//  HelloWorldLayer.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 10..
//  Copyright sj 2013년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

#import "MyCocos2DClass.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CGSize size = [[CCDirector sharedDirector] winSize];
        
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"http://www.ljob.co.kr" fontName:@"Marker Felt" fontSize:20];
        
		label.position =  ccp( size.width /2 , size.height/5 );
		[self addChild: label];
        
        
        [CCMenuItemFont setFontSize:32];
        
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
		
        
	}
	return self;
}


-(void)displayNext:(id)sender
{
    switch ([(CCMenuItemFont*)sender tag]) {
        case 1001:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[MyCocos2DClass node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFade transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1002:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[MyCocos2DClass node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionFlipAngular transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1003:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[MyCocos2DClass node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionShrinkGrow transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        case 1004:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[MyCocos2DClass node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInB transitionWithDuration:1.0                                                              scene:s1]];
        }
            
            break;
        case 1005:
        {
            CCScene *s1 = [CCScene node];
            
            [s1 addChild:[MyCocos2DClass node]];
            
            [[CCDirector sharedDirector]
             replaceScene:[CCTransitionMoveInT transitionWithDuration:1.0                                                              scene:s1]];
        }
            break;
        default:
            break;
    }
    
    NSLog(@"menu click");
    
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
