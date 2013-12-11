//
//  HelloWorldLayer.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 10..
//  Copyright sj 2013년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

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
    NSLog(@"hello world layer init");
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CCMenuItem *item1 = [CCMenuItemImage itemWithNormalImage:@"button_normal.png"
                                                   selectedImage:@"button_selected.png"
                                                          target:self
                                                        selector:@selector(btnClick:)];
        
        
        CCMenu *menu = [CCMenu menuWithItems:item1, nil];
        
        [menu setPosition:ccp(480/2, 320/2)];
        
        [self addChild:menu];
	

	}
	return self;
}

-(void)btnClick:(id)sender
{
    NSLog(@"button click");
}


@end