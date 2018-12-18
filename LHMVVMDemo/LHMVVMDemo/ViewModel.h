//
//  ViewModel.h
//  LHMVVMDemo
//
//  Created by liuzhihua on 2018/11/7.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(type,NSInteger) {
    
};

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) int index;

@end

@interface ViewModel : NSObject

@property (nonatomic,strong) NSMutableArray *dateSourceArr;

- (void)loadDataWithFnishedBlock:(dispatch_block_t)block;

- (void)headerRefreshDataWithFnishedBlock:(dispatch_block_t)block;

- (void)footerRefreshDataWithFnishedBlock:(dispatch_block_t)block;

@end

NS_ASSUME_NONNULL_END
