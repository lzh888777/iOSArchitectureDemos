//
//  ViewController.m
//  LHMVVMDemo
//
//  Created by liuzhihua on 2018/11/7.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "ViewController2.h"
#import "MJRefresh/MJRefresh/MJRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *arr;

@property (nonatomic,strong) ViewModel *vm;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    self.vm = [[ViewModel alloc] init];
    [self.vm loadDataWithFnishedBlock:^{
        [self.tableView reloadData];
    }];
    self.arr = self.vm.dateSourceArr;
}

- (void)headerRefresh{
    [self.vm headerRefreshDataWithFnishedBlock:^{
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)footerRefresh{
    [self.vm footerRefreshDataWithFnishedBlock:^{
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    }];
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
