//
//  MyCocos2DClass.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 11..
//  Copyright 2013년 sj. All rights reserved.
//

#import "MyCocos2DClass.h"
#import "MyChar.h"

@implementation MyCocos2DClass

// Needed to obtain the Navigation Controller

#pragma mark - HelloWorldLayer


// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MyCocos2DClass *layer = [MyCocos2DClass node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
    NSLog(@"MyCocos2DClass init");
    
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        CCSprite *backGround = [CCSprite spriteWithFile:@"backGround.png"];
        
        backGround.anchorPoint = ccp(0.0, 0.0);
        
        [backGround setScale:2.0];
        
        [self addChild:backGround];
        
        /*
         iPhone 3GS : 320 * 480
         iPhone 4 : 640 * 960
         iPhone 5 : 640 * 1136
         
         */
        
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"dragon.png"];
        MyChar *myChar = [MyChar spriteWithTexture:spriteSheet.texture
                                              rect:CGRectMake(0, 0, 75/2, 70/2)];
	
        [myChar setPosition:ccp(100, 200)];
        
        [self addChild:myChar];
    }
	return self;
}

@end