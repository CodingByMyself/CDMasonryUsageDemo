//
//  CDAutoCountHeightVC.m
//  CDMasonryUsageDemo
//
//  Created by Cindy on 2017/12/12.
//  Copyright © 2017年 Cindy. All rights reserved.
//

#import "CDAutoCountHeightVC.h"
#import "AQAnimationsUsageVC.h"
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabelViewAutoList reloadData];
}

#pragma mark - UITableView Delegate Method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CDAutoTestCell *itemCell = [[CDAutoTestCell alloc] initWithRestorationIdentifier:@"CDAutoTestCell" onTableView:tableView selectionStyle:UITableViewCellSelectionStyleNone];
    
    itemCell.item = self.itemList[indexPath.row];
    
    return itemCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row == 1) {
//        return 80.0;
//    } else {
//        return tableView.rowHeight;
//    }
    
    return tableView.rowHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemList.count;
}

#pragma mark - Getter Method
- (UITableView *)tabelViewAutoList
{
    if (_tabelViewAutoList == nil) {
        _tabelViewAutoList = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tabelViewAutoList.backgroundColor = [UIColor groupTableViewBackgroundColor];
        //        [_tabelViewMain setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self.view addSubview:_tabelViewAutoList];
        [_tabelViewAutoList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
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
