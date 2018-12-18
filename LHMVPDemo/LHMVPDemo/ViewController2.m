//
//  ViewController2.m
//  LHMVVMDemo
//
//  Created by liuzhihua on 2018/11/8.
//  Copyright © 2018年 TouchPal. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches
              withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
