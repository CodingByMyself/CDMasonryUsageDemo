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

@property (nonatomic,strong) UIButton *view1;
@property (nonatomic,strong) UIButton *view2;

@end

@implementation CDMasonryCompressionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /*
     * intrinsicContentSize: 这个是view 的真实的 大小size
     * 抗拉伸 和 抗压缩 都是相对于intrinsicContentSize 值来说的
     **/
    
    
#if 0
    /*
     * 抗拉伸
     * 主要用在
     * view1、view2 限制后 还有空余空间，这个时候就需要谁来拉伸了，才能满足我们的限制
     * setContentHuggingPriority（值越高，越不容易拉伸，又名为‘抗拉伸（别拉我）’）
     **/
    [self.view1 setTitle:@"视图1" forState:UIControlStateNormal];
    [self.view2 setTitle:@"我是视图2" forState:UIControlStateNormal];
    
    /*
     * 保证view1 不被拉伸，那么只能拉伸view2
     **/
    [self.view1 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self.view2 setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
#else
    /*
     * 抗压缩
     * 主要用在
     * eg：view1、view2 限制后 ，没有空余空间，这个时候就 只能压缩某个view，才能满足我们的限制
     * setContentCompressionResistancePriority（值越高，越不容易压缩，又名为‘抗压缩（别挤我）’）
     **/
    [self.view1 setTitle:@"我是内容超长超长超长的视图1" forState:UIControlStateNormal];
    [self.view2 setTitle:@"我是内容长超长超长视图2" forState:UIControlStateNormal];
    
    /*
     * 保证view2 不被压缩，那么只能压缩view1
     **/
    [self.view1 setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [self.view2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
#endif

    
}


#pragma mark - Getter Method
- (UIButton *)view1
{
    if (_view1 == nil) {
        _view1 = [[UIButton alloc] init];
        _view1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_view1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_view1 setTitle:@"视图1" forState:UIControlStateNormal];
        [self.view addSubview:_view1];
        [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10.0);
            make.centerY.equalTo(self.view);
            make.right.equalTo(self.view2.mas_left).offset(-15.0);
            make.height.equalTo(@30.0);
        }];
    }
    return _view1;
}

- (UIButton *)view2
{
    if (_view2 == nil) {
        _view2 = [[UIButton alloc] init];
        _view2.backgroundColor = [UIColor yellowColor];
        [_view2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_view2 setTitle:@"视图2" forState:UIControlStateNormal];
        [self.view addSubview:_view2];
        [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view1.mas_right);
            make.right.equalTo(self.view).offset(-10.0);
            make.centerY.equalTo(self.view);
            make.height.equalTo(@30.0);
        }];
    }
    return _view2;
}



@end
