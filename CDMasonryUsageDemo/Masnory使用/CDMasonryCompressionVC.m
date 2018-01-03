//
//  CDMasonryCompressionVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2018/1/3.
//  Copyright © 2018年 Cindy. All rights reserved.
//

#import "CDMasonryCompressionVC.h"
#import "Masonry.h"

@interface CDMasonryCompressionVC ()

@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UIButton *button2;

@end

@implementation CDMasonryCompressionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.button1 setTitle:@"视图1" forState:UIControlStateNormal];
//    [self.button1 setContentHuggingPriority:1001 forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.button2 setTitle:@"我是视图2" forState:UIControlStateNormal];
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
            make.left.equalTo(self.view).offset(30.0);
            make.centerY.equalTo(self.view);
            make.right.equalTo(self.button2.mas_left);
            make.height.equalTo(@60.0);
        }];
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
            make.left.equalTo(self.button1.mas_right);
            make.right.equalTo(self.view).offset(-30.0);
            make.centerY.equalTo(self.view);
            make.height.equalTo(@60.0);
        }];
    }
    return _button2;
}



@end
