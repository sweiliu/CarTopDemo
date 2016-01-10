//
//  ImageHeardView.m
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "ImageHeardView.h"

@implementation ImageHeardView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        [self addSubview:imageView];
        _imageView = imageView;
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height-25, frame.size.width, 25)];
        [self addSubview:titleLable];
        titleLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        titleLable.font = [UIFont boldSystemFontOfSize:13];
        _titleLable = titleLable;

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWebAction)];
        [self addGestureRecognizer:tapGesture];
        

    }
    return self;
}

- (void)goToWebAction {
    NSLog(@"点击图片");

    WebViewControllers *webView = [[WebViewControllers alloc]initWithWebUrl:nil andBodyStr:_bodyStr];
    
    [_viewController.navigationController pushViewController:webView animated:YES];
    
}
- (void)imageHeardViewUpdateWithArr:(NSArray *)arr {
    
    
    _titleLable.text = [NSString stringWithFormat:@"%@",arr[0][@"title"]];
    
     _bodyStr = [NSString stringWithFormat:@"%@",arr[0][@"resourceLoc"]];
    
    NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",arr[0][@"picUrl"]]]];
    [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            return;
        }
        [_imageView setImage:[UIImage imageWithData:data]];
    }];
}

@end
