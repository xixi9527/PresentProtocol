//
//  ViewController2.m
//  PresentProtocol
//
//  Created by 喻佳珞 on 2017/11/16.
//  Copyright © 2017年 喻佳珞. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images-1.jpg"]];
    imgView.userInteractionEnabled = YES;
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(btn)];
    self.navigationItem.leftBarButtonItem = btn;
    
    
}

- (void)btn
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
