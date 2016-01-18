//
//  ScrollHeardView.m
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#define W_SIZE [UIScreen mainScreen].bounds.size.width
#import "ScrollHeardView.h"

@implementation ScrollHeardView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:scrollView];
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(6*W_SIZE, 0);
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        
        
        CGFloat x = 0, y = 0, width = W_SIZE, height = 200;
        for (int i = 1; i < 7; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *imageTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWebAction)];
            [imageView addGestureRecognizer:imageTapGesture];
            [scrollView addSubview:imageView];
            imageView.tag = i;
            x = width * i;
        }
        
        //文字
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-25, frame.size.width, 25)];
        [self addSubview:titleLable];
        titleLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        titleLable.font = [UIFont boldSystemFontOfSize:15];
        _titleLable = titleLable;
        
    }
    return self;
}


- (void)goToWebAction {
    
    
    NSDictionary *dic = _dataArr[_index];
    NSString *bodyStr;
    NSString *resourceLoc = dic[@"resourceLoc"];
    
    int count = [resourceLoc intValue];
    if (count > 6) {
        _webUrlStr = resourceLoc;
        bodyStr = nil;
        
    }else {
        _webUrlStr = nil;
        bodyStr = dic[@"resourceLoc"];
    }
    
    WebViewControllers *webView = [[WebViewControllers alloc]initWithWebUrl:_webUrlStr andBodyStr:bodyStr];
    
    [_viewController.navigationController pushViewController:webView animated:YES];
    
}

- (void)setArr:(NSArray *)arr {
    if (arr.count < 2) {
        return;
    }
    
    _dataArr = arr;
    _index = 0;
    
    for (int i = 0; i < arr.count; i++) {
        NSDictionary *dic = arr[i];
        
        UIImageView *imageView = [self viewWithTag:i+1];
        NSString *picUrl = dic[@"picUrl"];
        
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:picUrl]];
        [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (connectionError) {
                return;
            }
            
            [imageView setImage:[UIImage imageWithData:data]];
        }];
    }

}

- (void)scrollHeardViewUpdateWithArr:(NSArray *)arr {
    if (arr.count < 2) {
        return;
    }
    
    _dataArr = arr;
    _index = 0;
    
    for (int i = 0; i < arr.count; i++) {
        NSDictionary *dic = arr[i];
        
        UIImageView *imageView = [self viewWithTag:i+1];
        NSString *picUrl = dic[@"picUrl"];
        
        NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:picUrl]];
        [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            if (connectionError) {
                return;
            }
            
            [imageView setImage:[UIImage imageWithData:data]];
        }];
    }
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _index = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    NSDictionary *dic = _dataArr[_index];
    _titleLable.text = [NSString stringWithFormat:@"  %@",dic[@"title"]];
    _titleLable.textColor = [UIColor whiteColor];
}

@end
