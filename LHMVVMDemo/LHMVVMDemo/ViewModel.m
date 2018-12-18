//
//  ViewModel.m
//  LHMVVMDemo
//
//  Created by liuzhihua on 2018/11/7.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.dateSourceArr = [NSMutableArray array];
    }
    return self;
}x

- (void)loadDataWithFnishedBlock:(dispatch_block_t)block{
    //读取数据库，或者网络请求
    for (int i = 0; i < 10; ++ i) {
        DataModel *m = [[DataModel alloc] init];
        m.title = [NSString stringWithFormat:@"title_%d",i];
        m.index = i;
        [self.dateSourceArr addObject:m];
    }
    if (block) {
        block();
    }
}

- (void)headerRefreshDataWithFnishedBlock:(dispatch_block_t)block{
    //读取数据库，或者网络请求
    DataModel *firstModel = self.dateSourceArr.firstObject;
    DataModel *m = [[DataModel alloc] init];
    m.index = firstModel.index - 1;
    m.title = [NSString stringWithFormat:@"title_%d",m.index];
    [self.dateSourceArr insertObject:m atIndex:0];
    if (block) {
        block();
    }
}

- (void)footerRefreshDataWithFnishedBlock:(dispatch_block_t)block{
    //读取数据库，或者网络请求
    DataModel *lastModel = self.dateSourceArr.lastObject;
    DataModel *m = [[DataModel alloc] init];
    m.index = lastModel.index + 1;
    m.title = [NSString stringWithFormat:@"title_%d",m.index];
    [self.dateSourceArr addObject:m];
    if (block) {
        block();
    }
}

@end

@implementation DataModel

@end
