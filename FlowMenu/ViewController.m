//
//  ViewController.m
//  FlowMenu
//
//  Created by leewentao on 16/7/5.
//  Copyright © 2016年 leewentao. All rights reserved.
//

#import "ViewController.h"
#import "MenuScrollView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
   
    MenuScrollView *menu = [[MenuScrollView alloc] init];
    NSArray *arr = @[@"111",@"222",@"333",@"111",@"222",@"333",@"111",@"222",@"222",@"333",@"111"];
    menu.menuItemArray = arr;
    menu.frame = CGRectMake(0, 20, ScreenWidth, 40);
    [self.view addSubview:menu];

}

@end
