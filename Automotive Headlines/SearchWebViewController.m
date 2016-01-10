//
//  SearchWebViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/9/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "SearchWebViewController.h"

@implementation SearchWebViewController {

    
    NSString *_leftUrl;
    NSString *_centerUrl;
    NSString *_rightUrl;
}

- (instancetype)initWithLeftButtonWebUrl:(NSString *)leftUrl andCenterButtonUrl:(NSString *)centerUlr andRightButtonUrl:(NSString *)rightUrl {

    if (self = [super init]) {
        _leftUrl = leftUrl;
        _centerUrl = centerUlr;
        _rightUrl = rightUrl;
    }
    return self;
}

- (void)viewDidLoad {

    
    _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:_webView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,60, _webView.frame.size.width, _webView.frame.size.height)];

    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    if (_leftUrl.length <10 && _centerUrl.length <10 && _rightUrl.length <10) {
        [_webView addSubview:_tableView];
        
        _dataArr = [NSMutableArray array];
    }
    
    [self getUrl];
    
    
}

- (void)getUrl {

    [_dataArr removeAllObjects];
    
    NSInteger left  =  _leftUrl.length;
    NSInteger center = _centerUrl.length;
    NSInteger right = _rightUrl.length;
    
    
    
    if (_leftUrl != nil) {
        
        if (left > 6) {
            NSMutableURLRequest *imageWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_leftUrl]];
            [_webView loadRequest:imageWebRequest];
        }else{
            
            
            NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/getSpecialList"]];
            [commentsWebRequest setHTTPMethod:@"POST"];
            
            NSString *webUrlBody = [NSString stringWithFormat:@"special_id=%%%@",_leftUrl];
            NSData *bodyData = [webUrlBody dataUsingEncoding:NSUTF8StringEncoding];
            [commentsWebRequest setHTTPBody:bodyData];
            
            [NSURLConnection sendAsynchronousRequest:commentsWebRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                if (connectionError) {
                    return;
                }
            
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                NSArray *arr = dic[@"data"][0][@"newsList"];
                [_dataArr addObjectsFromArray:arr];
                [_tableView reloadData];
                
            }];
        }
    }
    
    
    if (_centerUrl != nil) {
        
        if (center > 6) {
            NSMutableURLRequest *imageWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_centerUrl]];
            [_webView loadRequest:imageWebRequest];
        }else{
            
            NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/getSpecialList"]];
            [commentsWebRequest setHTTPMethod:@"POST"];
            
            NSString *webUrlBody = [NSString stringWithFormat:@"special_id=%%%@",_centerUrl];
            NSData *bodyData = [webUrlBody dataUsingEncoding:NSUTF8StringEncoding];
            [commentsWebRequest setHTTPBody:bodyData];
            
            
            [NSURLConnection sendAsynchronousRequest:commentsWebRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                if (connectionError) {
                    return;
                }
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                NSArray *arr = dic[@"data"][0][@"newsList"];
                
                [_dataArr addObjectsFromArray:arr];
                [_tableView reloadData];
                
            }];
        }
    }
    
    
    
    if (_rightUrl != nil) {
        
        if (right > 6) {
            NSMutableURLRequest *imageWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_rightUrl]];
            [_webView loadRequest:imageWebRequest];
        }else{
            
            NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/News/getSpecialList"]];
            [commentsWebRequest setHTTPMethod:@"POST"];
            
            NSString *webUrlBody = [NSString stringWithFormat:@"special_id=%%%@",_rightUrl];
            NSData *bodyData = [webUrlBody dataUsingEncoding:NSUTF8StringEncoding];
            [commentsWebRequest setHTTPBody:bodyData];
            
            
            [NSURLConnection sendAsynchronousRequest:commentsWebRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                if (connectionError) {
                    return;
                }
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                NSArray *arr = dic[@"data"][0][@"newsList"];
                
                [_dataArr addObjectsFromArray:arr];
                [_tableView reloadData];
                
            }];
        }
    }
    
}

#pragma mark - UITableViewDelegate 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    _cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!_cell) {
        _cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    [_cell updateWithDic:_dataArr[indexPath.section]];
    return _cell;
}

- (BOOL) hidesBottomBarWhenPushed {
    
    return (self.navigationController.topViewController == self);
}


@end
