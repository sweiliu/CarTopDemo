//
//  ChoiceView.m
//  Automotive Headlines
//
//  Created by apple on 12/28/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "ChoiceView.h"
#import "ChoicCell.h"
#import "EGORefreshTableHeaderView.h"

#define REFRESH_HEADER_HEIGHT 52.0f

@interface ChoiceView()<UITableViewDataSource,UITableViewDelegate, EGORefreshTableHeaderDelegate>
{
    NSMutableArray *_dataArr;
    EGORefreshTableHeaderView *_refreshView;
    
}
@property (nonatomic,strong) UITableView *myTableView;

@end

@implementation ChoiceView

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *tableViewBackGroudColor = [UIColor colorWithRed:238 green:238 blue:238 alpha:1.0];
    
    self.navigationItem.title = @"精选";
    CGRect rect = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 60);
    self.myTableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.myTableView.backgroundColor = tableViewBackGroudColor;
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    [self.view addSubview:self.myTableView];
    
    //初始化下拉刷新控件
    EGORefreshTableHeaderView *refreshView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.myTableView.bounds.size.height, self.view.frame.size.width, self.myTableView.bounds.size.height)];
    refreshView.delegate = self;
    _refreshView = refreshView;
    //将下拉刷新控件作为子控件添加到UITableView中
    [self.myTableView addSubview:refreshView];
    
    _dataArr = [NSMutableArray array];
    [self update];
}

#pragma mark - 设置数据源
- (void)update
{
    [_dataArr removeAllObjects];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/Cars/getNewCarList"]];
    [NSURLConnection sendAsynchronousRequest:requst queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *arr = dic[@"data"];
        [_dataArr addObjectsFromArray:arr];
        
        [self.myTableView reloadData];
        
        [_refreshView egoRefreshScrollViewDataSourceDidFinishedLoading:self.myTableView];
    }];

}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _dataArr.count + 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == _dataArr.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lastCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lastCell"];
            cell.textLabel.textColor = [UIColor blackColor];
            cell.backgroundColor = [UIColor redColor];
        }
        cell.textLabel.text = @"loading";
        return cell;
    }

    ChoicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ChoicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.webView = self;
//    [cell.webView hidesTabBar:YES];
    [cell initData:_dataArr[indexPath.section]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == _dataArr.count) {
        [self update];
    }
}

#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == _dataArr.count) {
        return 40.f;
    }
    
    return 310.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return 0.f;
    }
    return 13.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 1.f;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view {
    [self update];
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view {
    return NO;
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view {
    return [NSDate date];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
//滚动控件的委托方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshView egoRefreshScrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_refreshView egoRefreshScrollViewDidEndDragging:scrollView];
}

@end
