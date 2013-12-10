//
//  MyCocos2DLayer.h
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 10..
//  Copyright 2013년 sj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MyCocos2DLayer : CCLayer {
    
    CCSprite *hyper;
}

+(CCScene *) scene;

-(void)TimerMethod:(ccTime)cct;

-(void)draw;



@end
