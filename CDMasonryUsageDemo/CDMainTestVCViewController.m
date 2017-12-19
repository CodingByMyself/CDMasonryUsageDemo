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
#import "AQMasnoryUsageVC.h"
#import "CDConstraintsPriorityVC.h"
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
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    [self setupDataSource];
    
    self.tabelViewMain.delegate = self;
    self.tabelViewMain.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataSource];
}

- (void)setupDataSource
{
    [self.funcViewControllers removeAllObjects];
    
    CDAutoCountHeightVC *autoVC = [[CDAutoCountHeightVC alloc] init];
    autoVC.title = @"Masonry自动计算高度";
    [self.funcViewControllers addObject:autoVC];
    
    AQAnimationsUsageVC *animationVC = [[AQAnimationsUsageVC alloc] init];
    animationVC.title = @"动画使用";
    [self.funcViewControllers addObject:animationVC];
    
    AQMasnoryUsageVC *masnoryUsageVC = [[AQMasnoryUsageVC alloc] init];
    masnoryUsageVC.title = @"Masnory使用 - 数组分类扩展";
    [self.funcViewControllers addObject:masnoryUsageVC];
    
    CDConstraintsPriorityVC *priorityVC = [[CDConstraintsPriorityVC alloc] init];
    priorityVC.title = @"Masnory使用 - 约束优先级";
    [self.funcViewControllers addObject:priorityVC];
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

#pragma mark - Getter Method
- (UITableView *)tabelViewMain
{
    if (_tabelViewMain == nil) {
        _tabelViewMain = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tabelViewMain.backgroundColor = [UIColor groupTableViewBackgroundColor];

        [self.view addSubview:_tabelViewMain];
        [_tabelViewMain mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
//            make.edges.equalTo(self.view).offset(0);
//            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0));
//            make.edges.mas_offset(UIEdgeInsetsMake(100.0, 100.0, 100.0, 100.0));
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
