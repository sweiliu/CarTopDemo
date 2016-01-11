//
//  TableHeardView.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "TableHeardView.h"
#import "CustomButton00.h"
#import "CustomButton01.h"
#import "MineWebViewController.h"

@interface TableHeardView()
{

    NSArray *_dataArr;
    
    NSString *_postStr;
    NSString *_bodyStr;
    NSString *_getStr;
    MineWebViewController *_view;
    UILabel *_lable;


}
@end
@implementation TableHeardView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
    CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, wSize, 200)];
    [imageView setImage:[UIImage imageNamed:@"my_bg"]];
    [self addSubview:imageView];
        
        NSArray *dataArr = @[@{@"img":@"me_login",@"title":@"账号登陆"},
                             @{@"img":@"weixin",@"title":@"微信登陆",@"POST":@"http://api.share.mob.com:80/log4",@"BODY":@"m=H4sIAAAAAAAAAM3OywqCQBQA0H0fY3feM0GbIISyh6JSSQuZZlJCplKJ4H58LfuEtmd1qqzYnmeECyrASKZBE6Sy1o44q%2BHrRkhKDDjqvOCeCwXeS8alUwKJqg0BqsCZC9rQRUMdbOOihx0GpAwZgAAk%2BGp9i91m1RYhm%2BbJMW7iQyjXPTV32JvnuEh3SXq6xeM7XENf6vmkWh7y3xYz8ActhA8PPU4YLwEAAA%3D%3D&t=1"},
                             @{@"img":@"weibo_sina",@"title":@"微博登陆",@"GET":@"https://api.weibo.com/oauth2/authorize?client_id=1662247435&response_type=code&redirect_uri=http%3A%2F%2Fsns.whalecloud.com%2Fsina2%2Fcallback&display=mobile"},
                             @{@"img":@"yuyue_my",@"title":@"预约"},
                             @{@"img":@"shoucang_my",@"title":@"收藏"},
                             @{@"img":@"guanzu_my",@"title":@"关注"},
                             @{@"img":@"shangcheng",@"title":@"商场"}];
        _dataArr = dataArr;
        CGFloat loginButtonX = 0;
        for (NSInteger index = 1; index <4; index++) {
            
            CustomButton00 *loginButton = [CustomButton00 buttonWithType:UIButtonTypeCustom];
            loginButton.frame = CGRectMake(loginButtonX+40, 70, 50, 80);
            [self addSubview:loginButton];
            [loginButton setTitle:_dataArr[index-1][@"title"] forState:UIControlStateNormal];
            [loginButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",_dataArr[index-1][@"img"]]] forState:UIControlStateNormal];
            loginButton.titleLabel.font = [UIFont systemFontOfSize:12];
            loginButton.tag = 100+index;
            [loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
            loginButtonX = index*125;
        }

        CGFloat functionButtonX = 0;
        for (NSInteger index = 3; index <7; index++) {
            
            CustomButton01 *functionButton = [CustomButton01 buttonWithType:UIButtonTypeCustom];
            functionButton.frame = CGRectMake(functionButtonX+30, 205, 31, 55);
            [self addSubview:functionButton];
            [functionButton setTitle:_dataArr[index][@"title"] forState:UIControlStateNormal];
            [functionButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",_dataArr[index][@"img"]]] forState:UIControlStateNormal];
            functionButton.titleLabel.font = [UIFont systemFontOfSize:11];
            [functionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [functionButton addTarget:self action:@selector(functuionAction:) forControlEvents:UIControlEventTouchUpInside];
            functionButton.tag = 10+index;
            functionButtonX = 95*(index-2);
            
        }
    }
    return self;
}

- (void)loginAction:(CustomButton00 *)btn {

    NSInteger idex = btn.tag-100;
    NSLog(@"点击了%@",_dataArr[idex-1][@"title"]);
    switch (idex) {
        case 1:
            if (self.delegate && [self.delegate respondsToSelector:@selector(shallowLable:)]) {
                [self.delegate shallowLable:YES];
            }
            break;
            
        case 2:
            _postStr = _dataArr[idex-1][@"POST"];
            _bodyStr = _dataArr[idex-1][@"BODY"];
            _view = [[MineWebViewController alloc]initWithPost:_postStr andBody:_bodyStr];
            [_pViewController.navigationController pushViewController:_view animated:YES];

            break;
        case 3:
            _getStr = _dataArr[idex-1][@"GET"];
            _view = [[MineWebViewController alloc]initWithGet:_getStr];
            [_pViewController.navigationController pushViewController:_view animated:YES];

            break;

    }
    
}
- (void)functuionAction:(CustomButton01 *)btn {
    
    NSInteger idex = btn.tag-10;
    NSLog(@"点击了%@",_dataArr[idex][@"title"]);
    switch (idex) {
        case 3:
            
            break;
            
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
    }
    //获取到当前View的layer
    
    CALayer *viewLayer = btn.layer;
    
    //获取当前View的位置
    
    CGPoint position = viewLayer.position;
    
    //移动的两个终点位置
    
    CGPoint beginPosition = CGPointMake(position.x + 10, position.y);
    
    CGPoint endPosition = CGPointMake(position.x - 10, position.y);
    
    //设置动画
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    //设置运动形式
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    //设置开始位置
    
    [animation setFromValue:[NSValue valueWithCGPoint:beginPosition]];
    
    //设置结束位置
    
    [animation setToValue:[NSValue valueWithCGPoint:endPosition]];
    
    //设置自动反转
    
    [animation setAutoreverses:YES];
    
    //设置时间
    
    [animation setDuration:.05];
    
    //设置次数
    
    [animation setRepeatCount:2];
    
    //添加上动画
    
    [viewLayer addAnimation:animation forKey:nil];
}

@end
