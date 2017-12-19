//
//  CDMainTestVCViewController.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDMainTestVCViewController.h"
#import "CDAutoCountHeightVC.h"
#import "CDBaseTableViewCell.h"
#import "AQAnimationsUsageVC.h"
#import "Masonry.h"

@interface CDMainTestVCViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tabelViewMain;
@property (nonatomic,strong) NSMutableArray <UIViewController *> *funcViewControllers;
@end

@implementation CDMainTestVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Masonry的使用";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupDataSource];
    
    self.tabelViewMain.delegate = self;
    self.tabelViewMain.dataSource = self;
}

- (void)setupDataSource
{
    CDAutoCountHeightVC *autoVC = [[CDAutoCountHeightVC alloc] init];
    autoVC.title = @"Masonry自动计算高度";
    [self.funcViewControllers addObject:autoVC];
    
    AQAnimationsUsageVC *animationVC = [[AQAnimationsUsageVC alloc] init];
    animationVC.title = @"动画使用";
    [self.funcViewControllers addObject:animationVC];
    
}

#pragma mark - UITableView Delegate Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDBaseTableViewCell *cell = [[CDBaseTableViewCell alloc] initWithRestorationIdentifier:@"CDBaseTableViewCell" onTableView:tableView selectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0];
    cell.textLabel.text = self.funcViewControllers[indexPath.row].title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:self.funcViewControllers[indexPath.row] animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.funcViewControllers.count;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

#pragma mark - Getter Method
- (UITableView *)tabelViewMain
{
    if (_tabelViewMain == nil) {
        _tabelViewMain = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tabelViewMain.sectionFooterHeight = 0;
        _tabelViewMain.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0.1f)];
        _tabelViewMain.tableFooterView = [UIView new];
        
        _tabelViewMain.backgroundColor = [UIColor groupTableViewBackgroundColor];
//        [_tabelViewMain setSeparatorStyle:UITableViewCellSeparatorStyleNone];

        [self.view addSubview:_tabelViewMain];
        [_tabelViewMain mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
//            make.edges.equalTo(self.view);
        }];
    }
    return _tabelViewMain;
}

- (NSMutableArray <UIViewController *> *)funcViewControllers
{
    if (_funcViewControllers == nil) {
        _funcViewControllers = [[NSMutableArray alloc] init];
    }
    return _funcViewControllers;
}



@end
