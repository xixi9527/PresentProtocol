//
//  TransitioningDelegate.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "SwipeTransitionInteractionController.h"

@implementation TransitioningDelegate



- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionAnima alloc] init];
}
//
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[TransitionAnima alloc] init];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    if (self.gestureRecognizer) {
        return [[SwipeTransitionInteractionController alloc] initWithGestureRecognizer:self.gestureRecognizer edgeForDragging:self.targetEdge];
    }
    return nil;
}




@end
