//
//  SearchViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController()<UISearchControllerDelegate> {
    BOOL height;
    BOOL isTyple;
}

@end

#define W_SIZE [UIScreen mainScreen].bounds.size.width
@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated {

    self.navigationItem.title = @"分类搜索";
    
    self.tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0.1, W_SIZE, self.view.frame.size.height-70)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    _searchController  = [[UISearchController alloc]initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
//    _searchController.delegate = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    [_searchController.searchBar sizeToFit];
    _searchController.searchBar.showsSearchResultsButton = YES;
    _tableView.tableHeaderView = _searchController.searchBar;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}


- (void)initData {
    
    
    _dataArr = @[@{@"leftImg":@"tougao1 copy",@"centerImg":@"tougao1 copy",@"rightImg":@"",@"underlineImg":@"tougao1 copy",@"leftTitle":@"选题会",@"centerTitle":@"头条客",@"rightTitle":@"投稿", @"leftButtonUrl":@"http://m.qctt.cn/ttk/index",@"centerButtonUrl":@"http://m.qctt.cn/index/TtkAuthor",@"rightButton":@"http://m.qctt.cn/index/login"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"五问速读",@"centerTitle":@"头条图说",@"rightTitle":@"头条解析", @"leftButtonUrl":@"407",@"centerButtonUrl":@"408",@"rightButton":@"4010"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条眼",@"centerTitle":@"头条数据",@"rightTitle":@"头条看板", @"leftButtonUrl":@"4012",@"centerButtonUrl":@"4013",@"rightButton":@"4016"},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"头条试驾",@"centerTitle":@"值不值得等",@"rightTitle":@"", @"leftButtonUrl":@"4017",@"centerButtonUrl":@"4019",@"rightButton":@""},
                 @{@"leftImg":@"",@"centerImg":@"",@"rightImg":@"",@"underlineImg":@"",@"leftTitle":@"修车坑不到",@"centerTitle":@"用车有B格",@"rightTitle":@"老司机支招", @"leftButtonUrl":@"4031",@"centerButtonUrl":@"4032",@"rightButton":@"4033"}];
    
    _titleArr = @[@"头条客",@"新车",@"行业",@"导购",@"用车",];
    _searchArr= [NSMutableArray array];
    height = YES;
    isTyple = YES;
}

#pragma mark - UITableViewDelegate 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (height) {
        
        return 50.f;
    }
    return 100.f;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (height) {
        return 40.f;
    }
    return 0.f;
}

#pragma mark - UITableViewDateSource 数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (_searchController.active) {
        if (isTyple) {
            Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"flag"];
            if (!cell) {
                cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"flag"];
            }
            height = NO;
            [cell updateWithDic:_searchArr[indexPath.section]];
            return cell;
        }
    }
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

    if (height) {
        
        return _dataArr.count;
    }
    return _searchArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
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

#pragma mark -UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {

    NSString *searchStr = [_searchController.searchBar text];
    if (searchStr.length == 0) {
        height = YES;
        isTyple = NO;
        [_tableView reloadData];
    }else{
        
        [_searchArr removeAllObjects];
        height = NO;
        isTyple = YES;
        NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/searchKeyWord"]];
        [commentsWebRequest setHTTPMethod:@"POST"];
        
        NSString *webUrlBody = [NSString stringWithFormat:@"page=0&keyWord=%@",searchStr];
        NSData *bodyData = [webUrlBody dataUsingEncoding:NSUTF8StringEncoding];
        [commentsWebRequest setHTTPBody:bodyData];
        
        [NSURLConnection sendAsynchronousRequest:commentsWebRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (connectionError) {
                return;
            }
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *arr = dic[@"data"][@"newsList"];
            [_searchArr addObjectsFromArray:arr];
            [_tableView reloadData];
            
        }];
 
        
    }
}


@end
