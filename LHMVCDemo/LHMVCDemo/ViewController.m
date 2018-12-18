//
//  ViewController.m
//  LHMVCDemo
//
//  Created by liuzhihua on 2018/11/8.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "MJRefresh/MJRefresh/MJRefresh.h"

@interface DataModel : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) int index;

@end

@implementation DataModel

@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arr = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    [self loadData];
    
}

- (void)loadData{
    //读取数据库，或者网络请求
    for (int i = 0; i < 10; ++ i) {
        DataModel *m = [[DataModel alloc] init];
        m.title = [NSString stringWithFormat:@"title_%d",i];
        m.index = i;
        [self.arr addObject:m];
    }
    [self.tableView reloadData];
    
}

- (void)headerRefresh{
    //读取数据库，或者网络请求
    DataModel *firstModel = self.arr.firstObject;
    DataModel *m = [[DataModel alloc] init];
    m.index = firstModel.index - 1;
    m.title = [NSString stringWithFormat:@"title_%d",m.index];
    [self.arr insertObject:m atIndex:0];
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    
}

- (void)footerRefresh{
    //读取数据库，或者网络请求
    DataModel *lastModel = self.arr.lastObject;
    DataModel *m = [[DataModel alloc] init];
    m.index = lastModel.index + 1;
    m.title = [NSString stringWithFormat:@"title_%d",m.index];
    [self.arr addObject:m];
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    DataModel *m = self.arr[indexPath.row];
    cell.textLabel.text = m.title;
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController2 *vc = [[ViewController2 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
