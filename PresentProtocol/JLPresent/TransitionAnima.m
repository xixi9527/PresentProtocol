//
//  TransitionAnima.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import "TransitionAnima.h"
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@implementation TransitionAnima

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transitionDuration = 0.4;
        
    }
    return self;
}

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    [containerView addSubview:toView];
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }
    
    if (toVC.presentingViewController == fromVC) {//present动画
        toView.frame = CGRectMake(SCREEN_SIZE.width, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        [UIView animateWithDuration:self.transitionDuration animations:^{
            fromView.frame = CGRectMake(-100, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
            toView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        } completion:^(BOOL finished) {
            BOOL wasCancel = [transitionContext transitionWasCancelled];
            if (wasCancel)
                [toView removeFromSuperview];
            [transitionContext completeTransition:!wasCancel];
        }];
    } else {//dismiss 动画
        fromView.layer.masksToBounds = NO;
        fromView.layer.shadowOffset = CGSizeMake(-3, 3);
        fromView.layer.shadowOpacity = 0.5;
        fromView.layer.shadowPath = [UIBezierPath bezierPathWithRect:fromView.bounds].CGPath;
        
        [containerView sendSubviewToBack:toView];
        toView.frame = CGRectMake(-100, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        [UIView animateWithDuration:self.transitionDuration animations:^{
            fromView.frame = CGRectMake(SCREEN_SIZE.width, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
            toView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        } completion:^(BOOL finished) {
            BOOL wasCancel = [transitionContext transitionWasCancelled];
            if (wasCancel)
                [toView removeFromSuperview];
            [transitionContext completeTransition:!wasCancel];
        }];
    }
    
    
}



@end
