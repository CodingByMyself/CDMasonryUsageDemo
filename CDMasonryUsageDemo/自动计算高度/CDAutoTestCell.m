//
//  CDAutoTestCell.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDAutoTestCell.h"

@interface CDAutoTestCell ()
@property (nonatomic,strong) UIImageView *imgviewlogo;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@end

@implementation CDAutoTestCell

// 当前cell类型的预估高度
+ (CGFloat)cellEstimatedHeightForTheData:(NSString *)detail
{
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.font = [UIFont systemFontOfSize:13.0];
   
    detailLabel.text = detail;
    
    CGFloat autoEsttimated = [detailLabel textRectForBounds:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 15.0 - 70.0 - 20.0*2 , CGFLOAT_MAX) limitedToNumberOfLines:0].size.height;
    
    return autoEsttimated;
}



#pragma mark - Setter Method
- (void)setItem:(NSDictionary *)item
{
    _item = item;
    
    self.imgviewlogo.image = [UIImage imageNamed:self.item[@"imageName"]];
    self.titleLabel.text = self.item[@"title"];
    self.detailLabel.text = self.item[@"detail"];
    
    //设置行间距
//        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.detailLabel.text];;
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//        [paragraphStyle setLineSpacing:10];
//        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.detailLabel.text.length)];
//
//        self.detailLabel.attributedText = attributedString;
}


#pragma mark - Getter Method
- (UIImageView *)imgviewlogo
{
    if (_imgviewlogo == nil) {
        _imgviewlogo = [[UIImageView alloc] init];
        _imgviewlogo.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_imgviewlogo];
        [_imgviewlogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(15.0);
            make.width.height.equalTo(@70);
            make.height.greaterThanOrEqualTo(@70.0);
        }];
    }
    return _imgviewlogo;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = [UIColor colorWithRed:251.0/255 green:177.0/255 blue:84.0/255 alpha:1.0];
        _titleLabel.font = [UIFont systemFontOfSize:18.0];
        
        [self.contentView addSubview:_titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(15.0);
            make.left.equalTo(self.imgviewlogo.mas_right).offset(15.0);
            make.right.equalTo(self.contentView).offset(-15.0);
            make.height.mas_lessThanOrEqualTo(50.0);
        }];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = [UIFont systemFontOfSize:13.0];
        _detailLabel.textColor = [UIColor colorWithRed:72.0/255 green:68.0/255 blue:69.0/255 alpha:1.0];
        
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.0);
            make.left.equalTo(self.imgviewlogo.mas_right).offset(20.0);
            make.right.equalTo(self.contentView).offset(-20.0);
            make.bottom.equalTo(self.contentView).offset(-20.0);
        }];
    }
    return _detailLabel;
}


@end
