//
//  HelloWorldLayer.h
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 10..
//  Copyright sj 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CGPoint bombPos;
    
    NSInteger life;
    
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
