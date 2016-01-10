//
//  ViewControllers.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "ViewControllers.h"
#import "ViewControllersCell.h"
#import "Cell.h"
@interface ViewControllers()<UITableViewDataSource,UITableViewDelegate, ViewControllersCellDelegate>{

    NSMutableArray *_viewControllerData;
    
    UITableView *_myTableView;
    
    NSMutableArray *_tableHearImageViewData;
    
    NSDictionary *_dic;
    

    NSArray *_arr;
    
    NSString *_urlStr;
    

    
}

@end

@implementation ViewControllers

-(void)viewDidLoad{

    [super viewDidLoad];
    
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    
    UITableView *myTableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake( 0, 125, mainSize.width, 25)];
    
    backView.alpha = 0.5;
    backView.backgroundColor = [UIColor blackColor];
    
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, mainSize.width-20, 25)];
    self.titleLable.backgroundColor = [UIColor clearColor];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont boldSystemFontOfSize:13];

    
    self.tableHearView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, mainSize.width, 150)];
    self.tableHearView.userInteractionEnabled = YES;
    
    UIButton *tableHeardViewButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, mainSize.width, 150)];
    tableHeardViewButton.backgroundColor = [UIColor clearColor];
    [tableHeardViewButton addTarget:self action:@selector(goToWeb) forControlEvents:UIControlEventTouchUpInside];
    [self.tableHearView addSubview:tableHeardViewButton];
    
    myTableView.tableHeaderView = self.tableHearView;
    [self.tableHearView addSubview:backView];
    [backView addSubview:self.titleLable];
    

    [self.view addSubview:myTableView];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    _myTableView = myTableView;
    _viewControllerData = [NSMutableArray array];
    _tableHearImageViewData = [NSMutableArray array];
    _arr = [NSArray array];

}


- (void)tableViewDataWithStr:(NSString *)dataStr andTableHeardViewImage:(NSString *)imageStr{
    
    if (_viewControllerData.count > 0) {
        return;
    }
    
    //viewsControllerData数据
    NSMutableURLRequest *viewsRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/getNewsList"]];
    [viewsRequest setHTTPMethod:@"POST"];
    
    
    NSData *viewControllerData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    [viewsRequest setHTTPBody:viewControllerData];
    
    [NSURLConnection sendAsynchronousRequest:viewsRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *arr = dic[@"data"][@"newsList"];
        [_viewControllerData addObjectsFromArray:arr];
        [_myTableView reloadData];
    }];
    
    //tableHeardImage数据
    NSMutableURLRequest *tableHeardImageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/Adverqctt/getFocus"]];
    [tableHeardImageRequest setHTTPMethod:@"POST"];
    NSData *data = [imageStr dataUsingEncoding:NSUTF8StringEncoding];
    [tableHeardImageRequest setHTTPBody:data];
    
    [NSURLConnection sendAsynchronousRequest:tableHeardImageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([dic[@"statusCode"] integerValue] == 401) {
            return;
        }
        
        NSArray *arr = dic[@"data"][@"focusList"];
        _urlStr = [NSString stringWithFormat:@"%@",arr[0][@"resourceLoc"]];
        NSLog(@"%@",_urlStr);

        self.titleLable.text = arr[0][@"title"];
        NSLog(@"%@",self.titleLable.text);
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",arr[0][@"picUrl"]]]];
        [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (connectionError) {
                return;
            }
            [_tableHearView setImage:[UIImage imageWithData:data]];
            [_myTableView reloadData];
        }];
    }];
    

    

}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _viewControllerData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//        cell.pViewController = self;
//        cell.delegate = self;
//        
//        [cell setGoToWebBlock:^(NSString *url) {
//            WebViewController *vc = [[WebViewController alloc] initWithUrl:url];
//            [self.navigationController pushViewController:vc animated:YES];
//        }];
    }
    cell.viewControllersWebView = self;
    [cell updateWithDic:_viewControllerData[indexPath.section]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

#pragma mark - ViewControllersCellDelegate
- (void)goToWebUrl:(NSString *)webUrl {
    WebViewControllers *vc = [[WebViewControllers alloc] initWithWebUrl:nil andBodyStr:webUrl];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToWeb{
    
    NSLog(@"16541");
    NSString *urlStr = [NSString stringWithFormat:@"http://m.autodatalive.com/html/mobile/news_new/showapi5-%@.html",_urlStr];
    
    WebViewControllers *webViewControllers = [[WebViewControllers alloc]initWithWebUrl:nil andBodyStr:urlStr];
    
    [self.navigationController pushViewController:webViewControllers animated:YES];
    
    
}
@end
