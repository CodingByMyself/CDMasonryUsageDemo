//
//  CDMasnoryBasicVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/20.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDMasnoryBasicVC.h"
#import "Masonry.h"

@interface CDMasnoryBasicVC ()
@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UIButton *button2;
@property (nonatomic,strong) UIButton *button3;
@property (nonatomic,strong) UIButton *button4;
@end

@implementation CDMasnoryBasicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.button1 setTitle:@"视图1" forState:UIControlStateNormal];
//    [self.button1 addTarget:self.button1 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button2 setTitle:@"视图2" forState:UIControlStateNormal];
//    [self.button2 addTarget:self.button2 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button3 setTitle:@"视图3" forState:UIControlStateNormal];
//    [self.button3 addTarget:self.button3 action:@selector(removeFromSuperview) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button4 setTitle:@"视图4" forState:UIControlStateNormal];
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
            // make.top.equalTo(self.view).offset(20.0); // 会导致导航栏遮挡了部分视图
            make.top.equalTo(self.mas_topLayoutGuide).offset(20.0); // mas_topLayoutGuide属性是Masonry针对UIViewController的扩展属性用来检测导航栏存在时动态偏移（类似安全距离）
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.height.equalTo(@60.0);
        }];
    }
    return _button1;
}

- (UIButton *)button2
{
    if (_button2 == nil) {
        _button2 = [[UIButton alloc] init];
        _button2.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button2 setTitle:@"视图2" forState:UIControlStateNormal];
        [self.view addSubview:_button2];
        [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(self.button1.mas_bottom).offset(10.0);
            make.height.equalTo(@60.0);
        }];
    }
    return _button2;
}

- (UIButton *)button3
{
    if (_button3 == nil) {
        _button3 = [[UIButton alloc] init];
        _button3.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button3 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button3 setTitle:@"视图3" forState:UIControlStateNormal];
        [self.view addSubview:_button3];
        [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(self.button2.mas_bottom).offset(10.0);
            make.height.equalTo(@60.0);
        }];
    }
    return _button3;
}

- (UIButton *)button4
{
    
    if (_button4 == nil) {
        _button4 = [[UIButton alloc] init];
        _button4.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_button4 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button4 setTitle:@"视图4" forState:UIControlStateNormal];
        [self.view addSubview:_button4];
        [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(20.0);
            make.right.equalTo(self.view).offset(-20.0);
            make.top.equalTo(self.button3.mas_bottom).offset(10.0);
//            make.height.equalTo(@60.0);
//            make.height.equalTo(self.button3).multipliedBy(2); // 乘以xx;
//            make.height.equalTo(self.button3).dividedBy(2); // 除以xx;
            make.height.equalTo(self.view).dividedBy(3); // 占屏幕内容区域的三分之一；
        }];
    }
    return _button4;
}





@end
