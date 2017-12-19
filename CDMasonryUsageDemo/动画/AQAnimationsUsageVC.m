//
//  AQAnimationsUsageVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/19.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "AQAnimationsUsageVC.h"
#import "Masonry.h"

@interface AQAnimationsUsageVC ()
@property (nonatomic,strong) UILabel *labelTips;
@property (nonatomic,strong) UIImageView *imageViewBg;


@property (nonatomic,strong) UIButton *buttonShowTips;
@property (nonatomic,strong) UIButton *buttonShowMenu;
@end

@implementation AQAnimationsUsageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.buttonShowTips.tag = 0;
    [self.buttonShowTips addTarget:self action:@selector(showAnimationAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonShowMenu.tag = 1;
    [self.buttonShowMenu addTarget:self action:@selector(showAnimationAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - IBAction Method
- (void)showAnimationAction:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            [self.labelTips mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.labelTips.superview).offset(64.0);
            }];
            
            [UIView animateWithDuration:0.4 animations:^{
                
                [self.labelTips.superview layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.labelTips mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(self.labelTips.superview).offset(-50.0);
                    }];
                    
                    [UIView animateWithDuration:0.45 animations:^{
                        [self.labelTips.superview layoutIfNeeded];
                    } completion:^(BOOL finished) {
                        [self.labelTips removeFromSuperview];
                        self.labelTips = nil;
                    }];
                });
                
            }];
        }
            break;
        case 1:
        {
            if (_imageViewBg == nil) {
                [self.imageViewBg mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@100.0);
                    make.width.equalTo(@80.0);
                }];
                
                [UIView animateWithDuration:0.3 animations:^{
                    [self.imageViewBg.superview layoutIfNeeded];
                }];
                
            } else {
                [self.imageViewBg mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(@1.0);
                    make.width.equalTo(@1.0);
                }];
                
                [UIView animateWithDuration:0.2 animations:^{
                    self.imageViewBg.alpha = 0.0;
                    [self.imageViewBg.superview layoutIfNeeded];
                } completion:^(BOOL finished) {
                    [self.imageViewBg removeFromSuperview];
                    self.imageViewBg = nil;
                }];
            }
            
        }
            break;
        default:
            break;
    }
}

#pragma mark - Getter Method
- (UIButton *)buttonShowTips
{
    if (_buttonShowTips == nil) {
        _buttonShowTips = [[UIButton alloc] init];
        [_buttonShowTips setTitle:@"动画展示1" forState:UIControlStateNormal];
        [_buttonShowTips setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.view addSubview:_buttonShowTips];
        [_buttonShowTips mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_buttonShowTips.superview);
            make.right.equalTo(_buttonShowTips.superview);
            make.centerY.equalTo(_buttonShowTips.superview);
            make.height.equalTo(@60.0);
        }];
    }
    return _buttonShowTips;
}

- (UIButton *)buttonShowMenu
{
    if (_buttonShowMenu == nil) {
        _buttonShowMenu = [[UIButton alloc] init];
        [_buttonShowMenu setTitle:@"动画展示2" forState:UIControlStateNormal];
        [_buttonShowMenu setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self.view addSubview:_buttonShowMenu];
        [_buttonShowMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_buttonShowMenu.superview);
            make.right.equalTo(_buttonShowMenu.superview);
            make.top.equalTo(self.buttonShowTips.mas_bottom);
            make.height.equalTo(self.buttonShowTips);
        }];
    }
    return _buttonShowMenu;
}


#pragma mark -
- (UILabel *)labelTips
{
    if (_labelTips == nil) {
        _labelTips = [[UILabel alloc] init];
        _labelTips.backgroundColor = [UIColor yellowColor];
        _labelTips.font = [UIFont boldSystemFontOfSize:16.0];
        _labelTips.textAlignment = NSTextAlignmentCenter;
        _labelTips.textColor = [UIColor redColor];
        _labelTips.text = @"动画展示更新数字的提示";
        [self.view addSubview:_labelTips];
        [_labelTips mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_labelTips.superview);
            make.right.equalTo(_labelTips.superview);
            make.top.equalTo(_labelTips.superview).offset(0);
            make.height.equalTo(@40.0);
        }];
        // 立即执行约束是控件处于指定位置（即动画的起点位置）
        [_labelTips.superview layoutIfNeeded];
    }
    return _labelTips;
}

- (UIImageView *)imageViewBg
{
    if (_imageViewBg == nil) {
        _imageViewBg = [[UIImageView alloc] init];
        // 图片size调整
        UIImage *imageBg = [UIImage imageNamed:@"combined_shape"];
        _imageViewBg.image = [imageBg resizableImageWithCapInsets:UIEdgeInsetsMake(25, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        
        [self.view addSubview:_imageViewBg];
        [_imageViewBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.buttonShowMenu.mas_bottom);
            make.right.equalTo(self.buttonShowMenu.mas_centerX);
            make.height.equalTo(@1.0);
            make.width.equalTo(@1.0);
        }];
        // 立即执行约束是控件处于指定位置（即动画的起点位置）
        [_imageViewBg.superview layoutIfNeeded];
    }
    return _imageViewBg;
}

@end
