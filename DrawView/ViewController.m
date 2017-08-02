//
//  ViewController.m
//  DrawView
//
//  Created by aDu on 2017/7/22.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "ViewController.h"
#import "BackViewController.h"
#import "SearchViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"返回按钮";
}

- (IBAction)pushToBack:(id)sender {
    BackViewController *backVC = [[BackViewController alloc] init];
    [self.navigationController pushViewController:backVC animated:YES];
}

- (IBAction)searchBar:(id)sender {
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

@end
