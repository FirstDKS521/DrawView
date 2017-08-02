//
//  SearchViewController.m
//  DrawView
//
//  Created by aDu on 2017/8/1.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"

#define K_Cell @"cell"
@interface SearchViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataAry;
@property (nonatomic, strong) NSMutableArray *searchAry;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.hidesBackButton = YES; //隐藏返回按钮
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"搜索";
    searchBar.showsCancelButton = YES; //显示关闭按钮
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"]; //首先取出cancelBtn
    //这样就可以随便设置这个按钮了
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    searchBar.searchBarStyle = UISearchBarStyleMinimal; //去掉searchBar的周边颜色
    searchBar.frame = CGRectMake(0, 7, [UIScreen mainScreen].bounds.size.width, 30);
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    
    //造数据
    for (int i = 0; i < 20; i++) {
        NSString *str = [NSString stringWithFormat:@"阿杜-%@", @(i)];
        [self.dataAry addObject:str];
    }
}

#pragma mark ====== UITableViewDelegate ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    cell.titleLabel.text = self.searchAry[indexPath.row];
    return cell;
}

#pragma mark ====== UISearchBarDelegate ======
//文字输入结束
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.searchAry removeAllObjects];
    if ([searchText isEqualToString:@""]) {
        [self.tableView removeFromSuperview];
        return;
    }
    for (NSString *str in self.dataAry) {
        if ([str rangeOfString:searchText].location != NSNotFound) {
            [self.searchAry addObject:str];
        }
    }
    if (self.searchAry.count) {
        [self.view addSubview:self.tableView];
        [self.tableView reloadData];
    } else {
        [self.tableView removeFromSuperview];
    }
}

//点击Cancle按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ====== init ======
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"SearchCell" bundle:nil] forCellReuseIdentifier:K_Cell];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataAry {
    if (!_dataAry) {
        _dataAry = [NSMutableArray array];
    }
    return _dataAry;
}

- (NSMutableArray *)searchAry {
    if (!_searchAry) {
        _searchAry = [NSMutableArray array];
    }
    return _searchAry;
}

@end
