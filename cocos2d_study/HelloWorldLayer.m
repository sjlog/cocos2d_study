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
		
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello Particle" fontName:@"Marker Felt" fontSize:64];
        
        CGSize size = [[CCDirector sharedDirector]winSize];
        [label setPosition:ccp(size.width /2, size.height /2)];
        [self addChild:label];
        
        life = 0;
        
        [self schedule:@selector(upDate:)];
        
        [self setTouchEnabled:YES];
        
        [[[CCDirector sharedDirector] touchDispatcher]
         addTargetedDelegate:self
         priority:0
         swallowsTouches:YES];
        
        
	

	}
	return self;
}


-(void)upDate:(ccTime)dt
{
    life--;
    
    if (life > 0) {
        
        /*
        CCParticleSystem *bomb;
        bomb = [[CCParticleMeteor alloc]initWithTotalParticles:20];
        
        [bomb setDuration:0.3];
        [bomb setLife:0.5];
        [bomb setSpeed:40];
        [bomb setScale:self.scale];
        [bomb setPosition:bombPos];
        [bomb setAutoRemoveOnFinish:YES];
        bomb.texture = [[CCTextureCache sharedTextureCache]addImage:@"fire.png"];
        
        [self addChild:bomb];
         */

        CCParticleSystem *bomb;
        bomb = [[CCParticleSpiral alloc]initWithTotalParticles:50];
        
        [bomb setDuration:0.3];
        bomb.life = 1.0;
        bomb.lifeVar = 0.2;
        bomb.speedVar = 5.0;
        bomb.startSize = 10.0;
        bomb.position = bombPos;
        bomb.autoRemoveOnFinish = YES;

        bomb.texture = [[CCTextureCache sharedTextureCache]addImage:@"fire.png"];
        
        [self addChild:bomb];

    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [self convertTouchToNodeSpace:touch];
    
    bombPos = location;
    
    life = 10;
    
    
    return YES;

}


@end