//
//  TransitionAnima.h
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TransitionAnima : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,assign) NSTimeInterval transitionDuration;
@end
