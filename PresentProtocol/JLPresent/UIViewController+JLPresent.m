//
//  UIViewController+JLPresent.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2018/7/17.
//  Copyright © 2018年 喻佳珞. All rights reserved.
//

#import "UIViewController+JLPresent.h"
#import <objc/runtime.h>
#import "TransitioningHelp.h"

@implementation UIViewController (JLPresent)


//+(void)load
//{
//    /** 获取原始setBackgroundColor方法 */
//    Method originalM = class_getInstanceMethod([self class], @selector(presentViewController:animated:completion:));
//
//    /** 获取自定义的pb_setBackgroundColor方法 */
//    Method exchangeM = class_getInstanceMethod([self class], @selector(jl_presentViewController:));
//
//    /** 交换方法 */
//    method_exchangeImplementations(originalM, exchangeM);
//
//}

- (void)jl_presentViewController:(UIViewController *)viewControllerToPresent
{
    
//    self presentViewController:viewControllerToPresent animated:YES completion:<#^(void)completion#>
     TransitioningHelp *help = objc_getAssociatedObject(self, @selector(jl_presentViewController:));
    if ([help isKindOfClass:[TransitioningHelp class]]) {
//        NSLog(@"获取到了对象");
        help = [[TransitioningHelp alloc] initWithViewController:viewControllerToPresent andModel:0];
        objc_setAssociatedObject(self, @selector(jl_presentViewController:), help, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self presentViewController:viewControllerToPresent animated:YES completion:nil];
    } else {
        help = [[TransitioningHelp alloc] initWithViewController:viewControllerToPresent andModel:0];
        objc_setAssociatedObject(self, @selector(jl_presentViewController:), help, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self presentViewController:viewControllerToPresent animated:YES completion:nil];
    }
}

@end
