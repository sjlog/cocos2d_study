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
        
        CGSize size = [[CCDirector sharedDirector]winSize];

        _myChar = [CCSprite spriteWithFile:@"mychr.png"
                                      rect:CGRectMake(1, 1, 31, 31)];
        _myChar.position = ccp(size.width / 2, size.height / 5);
        _myChar.scale = 1.5;
        [self addChild:_myChar z:1];
        
        
        
        
        
        
        background1 = [CCSprite spriteWithFile:@"map.png"];
        background2 = [CCSprite spriteWithFile:@"map.png"];
        
        
        background1.scale = 2.0;
        background2.scale = 2.0;
        
        background1.position = ccp(size.width / 2, size.height / 2);
        background2.position = ccp(size.width / 2, size.height / 2 + size.height);
        
        
        
		[self addChild:background1 z:0];
        [self addChild:background2 z:0];
        
        [self schedule:@selector(Scroll:) interval:0.001];
        
        [self setTouchEnabled:YES];
		
	}
	return self;
}

-(void)registerWithTouchDispatcher{
    
    [[[CCDirector sharedDirector] touchDispatcher]
     addTargetedDelegate:self
     priority:0
     swallowsTouches:YES];
}

-(void)Scroll:(ccTime)ct
{
    CGSize size = [[CCDirector sharedDirector]winSize];
    
    background1.position = ccp(background1.position.x, background1.position.y - 1.0);
    background2.position = ccp(background2.position.x, background2.position.y - 1.0);
    
    if (background1.position.y < - (size.height / 2)) {
        background1.position = ccp(background1.position.x, size.height/2);
        background2.position = ccp(background2.position.x, size.height/2 + size.height);
    }
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    
    location = [[CCDirector sharedDirector]convertToGL:location];
    
    [_myChar setPosition:ccp(location.x, _myChar.position.y)];
}




@end



