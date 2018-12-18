//
//  ViewController.m
//  LHMVPDemo
//
//  Created by liuzhihua on 2018/11/8.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import "ViewController.h"
#import "TableViewPresenter.h"
#import "ViewController2.h"

@interface ViewController ()<TableViewPresenterDelegate>

@property (nonatomic,strong) TableViewPresenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[TableViewPresenter alloc] initWithVc:self];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
}

#pragma mark - TableViewPresenterDelegate
- (void)presenter:(TableViewPresenter *)presenter didSelectedCellAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewController2 *vc = [[ViewController2 alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
