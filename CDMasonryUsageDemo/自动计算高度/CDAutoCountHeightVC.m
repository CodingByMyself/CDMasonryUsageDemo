//
//  CDAutoCountHeightVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDAutoCountHeightVC.h"
#import "CDAutoTestCell.h"

@interface CDAutoCountHeightVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tabelViewAutoList;
@property (nonatomic,strong) NSArray *itemList;

@end

@implementation CDAutoCountHeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabelViewAutoList.estimatedRowHeight = 200.0;
    self.tabelViewAutoList.rowHeight = UITableViewAutomaticDimension;
    
    self.tabelViewAutoList.delegate = self;
    self.tabelViewAutoList.dataSource = self;
    
}

#pragma mark - UITableView Delegate Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDAutoTestCell *itemCell = [[CDAutoTestCell alloc] initWithRestorationIdentifier:@"CDAutoTestCell" onTableView:tableView selectionStyle:UITableViewCellSelectionStyleNone];
    
    itemCell.item = self.itemList[indexPath.row];
    
//    [itemCell layoutIfNeeded];
    
    return itemCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected ---> %zi-%zi",indexPath.section,indexPath.row);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemList.count;
}

#pragma mark - Getter Method
- (UITableView *)tabelViewAutoList
{
    if (_tabelViewAutoList == nil) {
        _tabelViewAutoList = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _tabelViewAutoList.sectionFooterHeight = 0;
        _tabelViewAutoList.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 0.1f)];
        _tabelViewAutoList.tableFooterView = [UIView new];
        
        _tabelViewAutoList.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //        [_tabelViewMain setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self.view addSubview:_tabelViewAutoList];
        [_tabelViewAutoList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
            //            make.edges.equalTo(self.view);
        }];
    }
    return _tabelViewAutoList;
}

- (NSArray *)itemList
{
    if (_itemList == nil) {
        _itemList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dataSourceList.plist" ofType:nil]];
    }
    return _itemList;
}


@end
