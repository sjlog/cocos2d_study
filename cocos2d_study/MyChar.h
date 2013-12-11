//
//  MyChar.h
//  cocos2d_study
//
//  Created by sangjo_itwill on 2013. 12. 11..
//  Copyright 2013년 sj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MyChar : CCSprite {

    CCAnimation *moveAni;
}

-(id)initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect;

@end
