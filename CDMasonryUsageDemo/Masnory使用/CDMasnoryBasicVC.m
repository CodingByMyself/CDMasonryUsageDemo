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
@property (nonatomic,strong) UIButton *button4_Subview;

@end

@implementation CDMasnoryBasicVC

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.button1 setTitle:@"视图1" forState:UIControlStateNormal];
//
//    [self.button2 setTitle:@"视图2" forState:UIControlStateNormal];
//
//    [self.button3 setTitle:@"视图3" forState:UIControlStateNormal];
    
    [self.button4 setTitle:@"视图" forState:UIControlStateNormal];
    
//    [self.button4_Subview setTitle:@"子视图" forState:UIControlStateNormal];
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
            make.top.equalTo(self.mas_topLayoutGuide).offset(20.0);
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
        _button2.backgroundColor = [UIColor yellowColor];
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
        _button3.backgroundColor = [UIColor orangeColor];
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

//- (UIButton *)button4
//{
//
//    if (_button4 == nil) {
//        _button4 = [[UIButton alloc] init];
//        _button4.backgroundColor = [UIColor cyanColor];
//        [_button4 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        [_button4 setTitle:@"视图4" forState:UIControlStateNormal];
//        [self.view addSubview:_button4];
//        [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view).offset(20.0);
//            make.right.equalTo(self.view).offset(-20.0);
//            make.top.equalTo(self.button3.mas_bottom).offset(10.0);
////            make.height.equalTo(@60.0);
////            make.height.equalTo(self.button3).multipliedBy(2); // 乘以xx;
////            make.height.equalTo(self.button3).dividedBy(2); // 除以xx;
//            make.height.equalTo(self.view).dividedBy(3); // 占屏幕内容区域的三分之一；
//        }];
//    }
//    return _button4;
//}








- (UIButton *)button4
{
    if (_button4 == nil) {
        _button4 = [[UIButton alloc] init];
        _button4.backgroundColor = [UIColor cyanColor];
        _button4.layer.borderColor = [UIColor orangeColor].CGColor;
        _button4.layer.borderWidth = 5.0;
        [_button4 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button4 setTitle:@"视图" forState:UIControlStateNormal];
        [self.view addSubview:_button4];
        [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide).offset(80); // mas_topLayoutGuide属性是Masonry针对UIViewController的扩展属性用来检测导航栏存在时动态偏移（类似安全距离）
            make.left.equalTo(self.view).offset(80);
            make.right.equalTo(self.view).offset(-80.0);
//            make.bottom.equalTo(self.view);
            make.bottom.equalTo(self.mas_bottomLayoutGuide).offset(-80.0); // mas_bottomLayoutGuide属性是Masonry针对UIViewController的扩展属性用来检测tabBar存在时动态偏移（类似安全距离）

            
            
            
//             make.edges.equalTo(self.view);  // 距离self.view四周的距离为0，这一个约束条件等同上面的四条约束,但是没有自动偏移故不能直接使用

//            make.edges.equalTo(self.view).offset(80.0);
//             make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(100.0, 100.0, 100.0, 100.0)); // 距离四周的距离是Insets结构体描述的距离
            // make.edges.mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0)); // 可以省去指定的视图对象，默认是当前视图的父视图；
            /*
             注意：如果直接添加make.edges.equalTo(self.view).offset(80);这个约束效果不等同make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0))，因为offset这个方法的入参描述的值都是相对一个布局坐标方向的，所以前面的约束会使得整个视图往坐标两个正向的方向偏移
             */
        }];
        
    }
    return _button4;
}

#pragma mark -

- (UIButton *)button4_Subview
{
    
    if (_button4_Subview == nil) {
        _button4_Subview = [[UIButton alloc] init];
        _button4_Subview.backgroundColor = [UIColor yellowColor];
        _button4_Subview.layer.borderColor = [UIColor magentaColor].CGColor;
        _button4_Subview.layer.borderWidth = 10.0;
        [_button4_Subview setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_button4_Subview setTitle:@"子视图" forState:UIControlStateNormal];
        [self.button4 addSubview:_button4_Subview];
        [_button4_Subview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_button4_Subview.superview);
            make.left.equalTo(_button4_Subview.superview);
            make.right.equalTo(_button4_Subview.superview);
            make.bottom.equalTo(_button4_Subview.superview);
            
//            make.height.equalTo(@30.0);
//            make.width.equalTo(@30.0);
//            make.size.equalTo(@(CGSizeMake(30.0, 30.0)));
//            make.center.equalTo(_button4_Subview.superview);
            
        }];
        
    }
    return _button4_Subview;
}


@end
