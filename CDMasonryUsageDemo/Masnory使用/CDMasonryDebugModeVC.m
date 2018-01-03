//
//  CDMasonryDebugModeVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/21.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDMasonryDebugModeVC.h"
#import "Masonry.h"

@interface CDMasonryDebugModeVC ()
@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UIButton *button2;
@property (nonatomic,strong) UIButton *button3;
@end

@implementation CDMasonryDebugModeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.mas_key = @"(self.view)";
    
    [self.button1 setTitle:@"视图1" forState:UIControlStateNormal];
    [self.button1 addTarget:self.button1 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button2 setTitle:@"视图2" forState:UIControlStateNormal];
    [self.button2 addTarget:self.button2 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button3 setTitle:@"视图3" forState:UIControlStateNormal];
    [self.button3 addTarget:self.button3 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - Getter Method
- (UIButton *)button1
{
    if (_button1 == nil) {
        _button1 = [[UIButton alloc] init];
        _button1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button1 setTitle:@"视图1" forState:UIControlStateNormal];
        [self.view addSubview:_button1];
        [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(self.mas_topLayoutGuide).offset(50.0);
            make.height.greaterThanOrEqualTo(@60.0);
            make.bottom.equalTo(self.view).offset(200.0);
        }];
        _button1.mas_key = @"(self.button1)";
    }
    return _button1;
}

- (UIButton *)button2
{
    if (_button2 == nil) {
        _button2 = [[UIButton alloc] init];
        _button2.backgroundColor = [UIColor yellowColor];
        [_button2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button2 setTitle:@"视图2" forState:UIControlStateNormal];
        [self.view addSubview:_button2];
        [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(_button1.mas_bottom).offset(10.0);
            make.top.equalTo(self.mas_topLayoutGuide).offset(100.0).priorityLow();
            make.height.equalTo(@60.0);
        }];
        _button2.mas_key = @"(self.button2)";
    }
    return _button2;
}

- (UIButton *)button3
{
    if (_button3 == nil) {
        _button3 = [[UIButton alloc] init];
        _button3.backgroundColor = [UIColor cyanColor];
        [_button3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button3 setTitle:@"视图3" forState:UIControlStateNormal];
        [self.view addSubview:_button3];
        [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(_button2.mas_bottom).offset(10.0);
            make.top.equalTo(_button1.mas_bottom).offset(10.0).priorityMedium();
            make.top.equalTo(self.mas_topLayoutGuide).offset(100.0).priorityLow();
            make.height.equalTo(@60.0);
        }];
        _button1.mas_key = @"(self.button3)";
    }
    return _button3;
}


@end
