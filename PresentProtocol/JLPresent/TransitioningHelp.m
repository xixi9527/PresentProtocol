//
//  TransitioningVHellp.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/17.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import "TransitioningHelp.h"
@interface TransitioningHelp ()
@property (nonatomic,strong) TransitioningDelegate *customTransitionDelegate;
@property (nonatomic,weak) UIViewController *weakVC;
@end

@implementation TransitioningHelp

- (instancetype)initWithViewController:(UIViewController *)vc andModel:(NSInteger)type
{
    self = [super init];
    if (self) {
      vc.transitioningDelegate = self.customTransitionDelegate;
        self.weakVC = vc;
        [self addGesWithView:vc.view];
    }
    return self;
}


- (void)addGesWithView:(UIView *)view
{
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePGR:)];
    edgePan.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:edgePan];
    
    self.customTransitionDelegate.gestureRecognizer = edgePan;
    self.customTransitionDelegate.targetEdge = UIRectEdgeLeft;
}


- (void)edgePGR:(UIScreenEdgePanGestureRecognizer *)edge
{
    if (edge.state == UIGestureRecognizerStateBegan) {
        [_weakVC dismissViewControllerAnimated:YES completion:nil];
    }
}

- (TransitioningDelegate *)customTransitionDelegate
{
    if (!_customTransitionDelegate) {
        _customTransitionDelegate = [[TransitioningDelegate alloc] init];
    }
    return _customTransitionDelegate;
}

@end
