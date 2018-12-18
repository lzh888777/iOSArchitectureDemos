//
//  TableViewPresenter.h
//  LHMVPDemo
//
//  Created by liuzhihua on 2018/11/8.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TableViewPresenter;

@protocol TableViewPresenterDelegate <NSObject>

@optional
- (void)presenter:(TableViewPresenter *)presenter didSelectedCellAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface TableViewPresenter : NSObject

- (instancetype)initWithVc:(UIViewController *)vc;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,weak) id<TableViewPresenterDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
