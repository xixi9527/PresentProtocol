//
//  TransitioningDelegate.h
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TransitionAnima.h"

@interface TransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

//! If this transition will be interactive, this property is set to the
//! gesture recognizer which will drive the interactivity.
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;

@property (nonatomic, readwrite) UIRectEdge targetEdge;

@end
