//
//  CDMainTestVCViewController.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDMainTestVCViewController.h"

@interface CDMainTestVCViewController ()
@property (nonatomic,strong) UITableView *tabelViewMain;
@end

@implementation CDMainTestVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Masonry的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    
}


#pragma mark - Getter Method
- (UITableView *)tabelViewMain
{
    if (_tabelViewMain == nil) {
        _tabelViewMain = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tabelViewMain.sectionFooterHeight = 0;
        _tabelViewMain.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0.1f)];
        _tabelViewMain.tableFooterView = [UIView new];
        
//        _tabelViewMain.backgroundColor = PMColorSchemeTableViewColor;
//        [_tabelViewMain setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//
//        [self.view addSubview:_tabelViewMain];
//        [_tabelViewMain mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.top.equalTo(self.view);
////            make.left.equalTo(self.view);
////            make.right.equalTo(self.view);
////            make.bottom.equalTo(self.view);
//
//        }];
    }
    return _tabelViewMain;
}

@end
