//
//  LastImageHeardView.m
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "LastImageHeardView.h"

@implementation LastImageHeatView


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
        [self addSubview:imageView];
        _imageView = imageView;
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 175, frame.size.width, 25)];
        [self addSubview:titleLable];
        titleLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        titleLable.font = [UIFont boldSystemFontOfSize:13];
        _titleLable = titleLable;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToWebAction)];
        [self addGestureRecognizer:tapGesture];
        
        NSArray *dataArr = @[@{@"img":@"admin",@"title":@"选题会"},
                             @{@"img":@"admin",@"title":@"头条客"},
                             @{@"img":@"admin",@"title":@"投稿"}];
        
        CGFloat buttonX = 25,lableX = 50;
        for (NSInteger index = 1; index <4; index ++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, 208, 20, 20)];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",dataArr[index-1][@"img"]]] forState:UIControlStateNormal];
            [self addSubview:button];
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(lableX, 210, 40, 30)];
            lable.text = [NSString stringWithFormat:@"%@",dataArr[index-1][@"titile"]];
            [self addSubview:lable];
            
            buttonX = buttonX + 100*index;
            lableX = lableX + 100*index;
            
        }
        
        
    }
    return self;
}

- (void)goToWebAction {
    
    WebViewControllers *webView = [[WebViewControllers alloc]initWithWebUrl:nil andBodyStr:_bodyStr];
    
    [self.viewController.navigationController pushViewController:webView animated:YES];
    
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
