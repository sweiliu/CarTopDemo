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
@interface TableHeardView()

@end
@implementation TableHeardView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
    CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, wSize, 200)];
    [imageView setImage:[UIImage imageNamed:@"my_bg"]];
    [self addSubview:imageView];
        

        
        CustomButton00 *loginButton = [CustomButton00 buttonWithType:UIButtonTypeCustom];
        loginButton.frame = CGRectMake(30, 70, 50, 80);
        [self addSubview:loginButton];
        [loginButton setTitle:@"账号登陆" forState:UIControlStateNormal];
        [loginButton setImage:[UIImage imageNamed:@"me_login"] forState:UIControlStateNormal];
        loginButton.titleLabel.font = [UIFont systemFontOfSize:12];

        
        CustomButton00 *loginButton01 = [CustomButton00 buttonWithType:UIButtonTypeCustom];
        loginButton01.frame = CGRectMake(170, 70, 50, 80);
        [self addSubview:loginButton01];
        [loginButton01 setTitle:@"微信登陆" forState:UIControlStateNormal];
        [loginButton01 setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
        loginButton01.titleLabel.font = [UIFont systemFontOfSize:12];

        
        CustomButton00 *loginButton02 = [CustomButton00 buttonWithType:UIButtonTypeCustom];
        loginButton02.frame = CGRectMake(300, 70, 50, 80);
        [self addSubview:loginButton02];
        [loginButton02 setTitle:@"微博登陆" forState:UIControlStateNormal];
        [loginButton02 setImage:[UIImage imageNamed:@"weibo_sina"] forState:UIControlStateNormal];
        loginButton02.titleLabel.font = [UIFont systemFontOfSize:12];

        
        
        CustomButton01 *functionButton = [CustomButton01 buttonWithType:UIButtonTypeCustom];
        functionButton.frame = CGRectMake(30, 205, 31, 55);
        [self addSubview:functionButton];
        [functionButton setTitle:@"预约" forState:UIControlStateNormal];
        [functionButton setImage:[UIImage imageNamed:@"yuyue_my"] forState:UIControlStateNormal];
        functionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [functionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        CustomButton01 *functionButton0 = [CustomButton01 buttonWithType:UIButtonTypeCustom];
        functionButton0.frame = CGRectMake(120, 205, 31, 55);
        [self addSubview:functionButton0];
        [functionButton0 setTitle:@"收藏" forState:UIControlStateNormal];
        [functionButton0 setImage:[UIImage imageNamed:@"shoucang_my"] forState:UIControlStateNormal];
        functionButton0.titleLabel.font = [UIFont systemFontOfSize:11];
        [functionButton0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        CustomButton01 *functionButton1 = [CustomButton01 buttonWithType:UIButtonTypeCustom];
        functionButton1.frame = CGRectMake(220, 205, 31, 55);
        [self addSubview:functionButton1];
        [functionButton1 setTitle:@"关注" forState:UIControlStateNormal];
        [functionButton1 setImage:[UIImage imageNamed:@"guanzu_my"] forState:UIControlStateNormal];
        functionButton1.titleLabel.font = [UIFont systemFontOfSize:11];
        [functionButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        CustomButton01 *functionButton2 = [CustomButton01 buttonWithType:UIButtonTypeCustom];
        functionButton2.frame = CGRectMake(310, 205, 31, 55);
        [self addSubview:functionButton2];
        [functionButton2 setTitle:@"商场" forState:UIControlStateNormal];
        [functionButton2 setImage:[UIImage imageNamed:@"shangcheng"] forState:UIControlStateNormal];
        functionButton2.titleLabel.font = [UIFont systemFontOfSize:11];
        [functionButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}



@end
