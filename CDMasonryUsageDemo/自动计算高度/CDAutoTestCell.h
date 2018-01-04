//
//  CDAutoTestCell.h
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDBaseTableViewCell.h"
#import "Masonry.h"

#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT  ([[UIScreen mainScreen] bounds].size.height)

@interface CDAutoTestCell : CDBaseTableViewCell

@property (nonatomic,strong) NSDictionary *item;


// 当前cell类型的预估高度
+ (CGFloat)cellEstimatedHeightForTheData:(NSString *)detail;


@end
