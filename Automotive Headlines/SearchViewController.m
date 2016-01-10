//
//  SearchViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "SearchViewController.h"

#define W_SIZE [UIScreen mainScreen].bounds.size.width
@implementation SearchViewController

- (void)viewDidLoad {

    self.navigationItem.title = @"分类搜索";
    
    self.tableView  = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];


    
    self.searchBar =[[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    [self.searchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchBar;
    self.searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:self.searchBar contentsController:self];
    [self setSearchDisplayController:self.searchDisplayController];
    [self.searchDisplayController setDelegate:self];
    [self.searchDisplayController setSearchResultsDataSource:self];
    self.searchBar.placeholder =@"输入关键字";
    
    [self initData];
}

- (void)initData {
    
    _searchResultsArr = [NSMutableArray array];
    
    _dataArr = @[
                 @{@"leftImg":@"tougao1 copy",@"centerImg":@"tougao1 copy",@"rightImg":@"",@"underlineImg":@"tougao1 copy",@"leftTitle":@"选题会",@"centerTitle":@"头条客",@"rightTitle":@"投稿", @"leftButtonUrl":@"http://m.qctt.cn/ttk/index",@"centerButtonUrl":@"http://m.qctt.cn/index/TtkAuthor",@"rightButton":@"http://m.qctt.cn/index/login"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"五问速读",@"centerTitle":@"头条图说",@"rightTitle":@"头条解析", @"leftButtonUrl":@"407",@"centerButtonUrl":@"408",@"rightButton":@"4010"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条眼",@"centerTitle":@"头条数据",@"rightTitle":@"头条看板", @"leftButtonUrl":@"4012",@"centerButtonUrl":@"4013",@"rightButton":@"4016"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条试驾",@"centerTitle":@"值不值得等",@"rightTitle":@"", @"leftButtonUrl":@"4017",@"centerButtonUrl":@"4019",@"rightButton":@""},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"修车坑不到",@"centerTitle":@"用车有B格",@"rightTitle":@"老司机支招", @"leftButtonUrl":@"4031",@"centerButtonUrl":@"4032",@"rightButton":@"4033"}];
    
    _titleArr = @[@"头条客",@"新车",@"行业",@"导购",@"用车",];
}

#pragma mark - UITableViewDelegate 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 40.f;
}

#pragma mark - UITableViewDateSource 数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SearchViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SearchViewControllerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.webViewController = self;
    [cell updateWithDic:_dataArr[indexPath.section]];
    [tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    cell.selectionStyle=UITableViewCellAccessoryNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return _titleArr[section];
}


//设置sction 的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W_SIZE, 40)];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:20];
    label.text = _titleArr[section];
    [backView addSubview:label];
    
    CGSize lableTextSize = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(200, 20) lineBreakMode:UILineBreakModeCharacterWrap];
    label.frame = CGRectMake(7, 10, lableTextSize.width, 20);
    
    UIView *underlineView = [[UIView alloc]initWithFrame:CGRectMake(7, 38, label.frame.size.width, 2)];
    underlineView.backgroundColor = [UIColor redColor];
    [backView addSubview:underlineView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(7+underlineView.frame.size.width, 38, W_SIZE-underlineView.frame.size.width-7, 2)];
    lineView.backgroundColor = [UIColor grayColor];
    [backView addSubview:lineView];
    
    return backView;
}



@end
