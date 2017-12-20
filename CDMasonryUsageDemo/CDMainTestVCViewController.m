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
#import "CDMasnoryBasicVC.h"
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
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.tabelViewMain.delegate = self;
    self.tabelViewMain.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupDataSource];
    [self.tabelViewMain reloadData];
}

#pragma mark - 数据源
- (void)setupDataSource
{
    [self.funcViewControllers removeAllObjects];
    
    CDMasnoryBasicVC *basicVC = [[CDMasnoryBasicVC alloc] init];
    basicVC.title = @"Masnory使用 - 基础用法";
    [self.funcViewControllers addObject:basicVC];
    
    CDConstraintsPriorityVC *priorityVC = [[CDConstraintsPriorityVC alloc] init];
    priorityVC.title = @"Masnory使用 - 约束优先级";
    [self.funcViewControllers addObject:priorityVC];
    
    AQMasnoryUsageVC *masnoryUsageVC = [[AQMasnoryUsageVC alloc] init];
    masnoryUsageVC.title = @"Masnory使用 - 数组分类扩展";
    [self.funcViewControllers addObject:masnoryUsageVC];
    
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
            
//            make.edges.equalTo(self.view);  // 距离self.view四周的距离为0，这一个约束条件等同上面的四条约束
            
//            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0)); // 距离四周的距离是Insets结构体描述的距离
//            make.edges.mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0)); // 可以省去指定的视图对象，默认是当前视图的父视图；
            /*
             注意：如果直接添加make.edges.equalTo(self.view).offset(80);这个约束效果不等同make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(80.0, 80.0, 80.0, 80.0))，因为offset这个方法的入参描述的值都是相对一个布局坐标方向的，所以前面的约束会使得整个视图往坐标两个正向的方向偏移
             */
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
