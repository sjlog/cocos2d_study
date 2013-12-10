//
//  MyCocos2DLayer.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 10..
//  Copyright 2013년 sj. All rights reserved.
//

#import "MyCocos2DLayer.h"


@implementation MyCocos2DLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MyCocos2DLayer *layer = [MyCocos2DLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
    
}

-(id)init
{
    if (self = [super init]) {
 
        
        /*
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello Cocos2D" fontName:@"Marker Felt" fontSize:64];
    
        CGSize size = [[CCDirector sharedDirector]winSize];
        label.position = ccp(size.width / 2, size.height /2 );
        [self addChild:label];
         */
        
//        hyper = [[CCSprite alloc]initWithFile:@"hyper-app-creators.png"];
        hyper = [CCSprite spriteWithFile:@"hyper-app-creators.png"];
        
        
        CGSize size = [[CCDirector sharedDirector]winSize];
        [hyper setPosition:CGPointMake(size.width /2 , size.height / 2)];
        
//        hyper.anchorPoint = CGPointMake(0, 0);  // 대상의 좌측 하단에 좌표를 가져감
        
        [hyper setFlipX:YES]; // 좌우 반전
        [hyper setFlipY:YES]; // 상하 반전
        
        //transform(move, rotation, scale)
        
        hyper.rotation = 45.0;
        hyper.scale = 2.0;
        
        hyper.opacity = 255;     //alphablend 0~255
        
        [hyper setScaleX:1.5];
        
        
        
        [self addChild:hyper];
        
        [self setTouchEnabled:YES];
        
        [self schedule:@selector(TimerMethod:)];
        
        
    }
    
    return self;
}

-(void)registerWithTouchDispatcher{
    [[[CCDirector sharedDirector] touchDispatcher]addTargetedDelegate:self
                                                    priority:0 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [self convertTouchToNodeSpace:touch];
    
    [hyper stopAllActions];
    
    id move = [CCMoveTo actionWithDuration:1.0f
                                  position:location];
    
    [hyper runAction:move];
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

-(void)TimerMethod:(ccTime)cct
{
    hyper.position = ccp(hyper.position.x + 50 * cct, hyper.position.y);
    
}

-(void)draw
{
    
}


@end
