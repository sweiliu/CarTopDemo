//
//  MainViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame] ) {
        
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    _tableView = tableView;
        _tViewController = _pViewController;
    [self setData];
    [self initData];
        
    }
    return self;
}
- (void)setData {

    
    
}

- (void)initData {

    _newsListData = [NSMutableArray array];
    _imageData = [NSMutableArray array];
    ImageHeardView *imageView = [[ImageHeardView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];

    _imageView = imageView;
    
    ScrollHeardView *scrollHearView = [[ScrollHeardView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
    _scrollHeardView = scrollHearView;

    
    LastImageHeatView *lastImageHeardView = [[LastImageHeatView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 235)];
    _lastImageHeardView = lastImageHeardView;
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _newsListData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.viewControllersWebView = _pViewController;
    [cell updateWithDic: _newsListData[indexPath.row]];
    _imageView.viewController = _pViewController;
    _scrollHeardView.viewController  = _pViewController;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100.f;
}

    

- (void)tableViewSetNewsListDataWithStr:(NSString *)newsListDataStr imageDateWithStr:(NSString *)imageDataStr {

//    
//    if (_newsListData.count > 0) {
//        return;
//    }
//    
    //NewsListData数据
    NSMutableURLRequest *viewsRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/getNewsList"]];
    [viewsRequest setHTTPMethod:@"POST"];
    
    
    NSData *viewControllerData = [newsListDataStr dataUsingEncoding:NSUTF8StringEncoding];
    [viewsRequest setHTTPBody:viewControllerData];
    
    [NSURLConnection sendAsynchronousRequest:viewsRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *arr = dic[@"data"][@"newsList"];
        [_newsListData addObjectsFromArray:arr];
        [_tableView reloadData];
    }];
    
    //ImageData数据
    NSMutableURLRequest *tableHeardImageRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/Adverqctt/getFocus"]];
    [tableHeardImageRequest setHTTPMethod:@"POST"];
    NSData *data = [imageDataStr dataUsingEncoding:NSUTF8StringEncoding];
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
        [_imageData addObjectsFromArray:arr];
//        [_scrollHeardView scrollHeardViewUpdateWithArr:arr];
        _scrollHeardView.arr = arr;
        
        [_imageView imageHeardViewUpdateWithArr:arr];
//        if (arr.count >1) {
//            [_scrollHeardView scrollHeardViewUpdateWithArr:arr];
//        }else {
//        
//            [_imageView imageHeardViewUpdateWithArr:arr];
//        }
        [_tableView reloadData];

    }];
    
}


- (void)tableViewSetHeardView:(int)tyleNum {
    
    switch (tyleNum) {
        case 200:
            _tableView.tableHeaderView = _scrollHeardView;
            break;
        
        case 100:
            _tableView.tableHeaderView = _imageView;
            break;
            
        case 300:
            _tableView.tableHeaderView = _lastImageHeardView;
            break;
    }
}

@end
