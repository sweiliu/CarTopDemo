//
//  MineWebViewController.m
//  Automotive Headlines
//
//  Created by apple on 1/11/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MineWebViewController.h"

@interface MineWebViewController()
{

    NSString *_postStr;
    NSString *_bodyStr;
    NSString *_getStr;
}

@end

@implementation MineWebViewController

- (void)viewDidAppear:(BOOL)animated {

    [self.navigationController setNavigationBarHidden:NO];
    
    NSLog(@"进入网页");
}

- (instancetype)initWithPost:(NSString *)postStr andBody:(NSString *)bodyStr {

    if (self = [super init]) {
        _postStr = postStr;
        _bodyStr = bodyStr;
    }
    return self;
}

- (instancetype)initWithGet:(NSString *)getStr {

    if (self = [super init]) {
        _getStr = getStr;
    }
    return self;
}

- (void)viewDidLoad {

    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    if (_postStr != nil && _bodyStr != nil) {
        
        
        NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_postStr]];
        [commentsWebRequest setHTTPMethod:@"POST"];
        
        NSData *bodyData = [_bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        [commentsWebRequest setHTTPBody:bodyData];
        
        [webView loadRequest:commentsWebRequest];
    }
    if (_getStr != nil) {
        
        NSMutableURLRequest *imageWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_getStr]];
        [webView loadRequest:imageWebRequest];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated {

    NSLog(@"MineWebViewController Dealloc");

}
@end
