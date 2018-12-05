//
//  ViewController.m
//  LineLoading
//
//  Created by 王楠 on 2018/12/5.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LineLoading.h"

@interface ViewController ()
{
    UIView *_tempView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, 100, 150, 50);
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _tempView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    _tempView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_tempView];
}

- (void)btnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _tempView.lineWidth = 3;
        _tempView.lineColor = [[UIColor alloc] initWithRed:arc4random()%256/256.0
                                                     green:arc4random()%256/256.0
                                                      blue:arc4random()%256/256.0
                                                     alpha:1.0];
        [_tempView startLoading];
    }else {
        [_tempView stopLoading];
    }
}

@end
