//
//  ViewController.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "UIViewController+JLPresent.h"

#import "TransitioningHelp.h"

@interface ViewController ()

@property (nonatomic,strong) TransitioningHelp *helper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images.jpg"]];
    imgView.userInteractionEnabled = YES;
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(0, 0, 80, 100);
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
}
- (void)btnClick
{
    ViewController2 *vc = [[ViewController2 alloc] init];
//
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.backgroundColor = [UIColor redColor];
//
    //必须持有这个helper
//    self.helper = [[TransitioningHelp alloc] initWithViewController:nav andModel:1];
//
//    [self presentViewController:nav animated:YES completion:nil];
    [self jl_presentViewController:nav];
    

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
