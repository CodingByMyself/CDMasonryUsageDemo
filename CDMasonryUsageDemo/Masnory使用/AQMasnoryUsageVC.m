//
//  AQMasnoryUsageVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/19.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "AQMasnoryUsageVC.h"
#import "Masonry.h"

@interface AQMasnoryUsageVC ()
@property (nonatomic,strong) UIView *viewTags;
@property (nonatomic,strong) NSMutableArray *viewArray;
@end

@implementation AQMasnoryUsageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //水平方向控件间隔固定等间隔（只需要针对数组批量添加垂直方向的约束即可）
//    [self.viewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
//                           withFixedSpacing:5
//                                leadSpacing:10
//                                tailSpacing:10];
    [self.viewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical
                                withFixedSpacing:5
                                     leadSpacing:10
                                     tailSpacing:10];
    
    [self.viewArray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(@0);
//        make.height.mas_equalTo(@50);
        make.left.mas_equalTo(@0);
        make.width.equalTo(@100.0);
    }];
}


#pragma mark - getter Method
- (UIView *)viewTags
{
    if (_viewTags == nil) {
        _viewTags = [[UIView alloc] init];
        _viewTags.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_viewTags];
        [_viewTags mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_viewTags.superview);
            make.right.equalTo(_viewTags.superview);
            make.centerY.equalTo(_viewTags.superview);
            make.height.equalTo(@250.0);
        }];
    }
    return _viewTags;
}

- (NSMutableArray *)viewArray
{
    if (_viewArray == nil) {
        _viewArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 4; i ++) {
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [button setTitle:[NSString stringWithFormat:@"标签%zi",i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [self.viewTags addSubview:button];
            [_viewArray addObject:button];
        }
    }
    return _viewArray;
}



@end
