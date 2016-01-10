//
//  WebViewControllers.m
//  Automotive Headlines
//
//  Created by apple on 1/5/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "WebViewControllers.h"

@implementation WebViewControllers{

    NSString *_webUrl;
    NSString *_bodyStr;
}

- (instancetype)initWithWebUrl:(NSString *)webUrl andBodyStr:(NSString *)bodyStr {

    if (self = [super init]) {
        _webUrl = webUrl;
        _bodyStr = bodyStr;
    }
    return self;
}

- (void)viewDidLoad{

    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    
    if (_webUrl != nil) {
        
        NSMutableURLRequest *imageWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://m.qctt.cn/html/mobile/news_new/showapi5-%@.html",_webUrl]]];
        [webView loadRequest:imageWebRequest];
        
    }else{

        NSMutableURLRequest *commentsWebRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.qctt.cn/qctt-api/5.0/index.php/Comment/getCollect"]];
        [commentsWebRequest setHTTPMethod:@"POST"];
        
        NSString *webUrlBody = [NSString stringWithFormat:@"userId=0&newsId=%@",_bodyStr];
        NSData *bodyData = [webUrlBody dataUsingEncoding:NSUTF8StringEncoding];
        [commentsWebRequest setHTTPBody:bodyData];
        
        [webView loadRequest:commentsWebRequest];
    }
    
    
    
}

- (BOOL) hidesBottomBarWhenPushed {
    
    return (self.navigationController.topViewController == self);
}

@end
