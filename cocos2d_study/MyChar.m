//
//  MyChar.m
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 11..
//  Copyright 2013년 sj. All rights reserved.
//

#import "MyChar.h"


@implementation MyChar

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect
{
    if (self = [super initWithTexture:texture rect:rect]) {
        NSMutableArray *moveArr = [NSMutableArray array];
        
        for (int i=0; i<10; i++) {
            [moveArr addObject:[CCSpriteFrame frameWithTexture:texture rect:CGRectMake(75*i/2, rect.origin.y, rect.size.width, rect.size.height)]];
            
        }
        
        moveAni = [CCAnimation animationWithSpriteFrames:moveArr delay:0.2];

        [self runAction:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:moveAni]]];
        
    }
    
    return self;
}

@end
