//
//  TableHeardView.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "TableHeardView.h"
@interface TableHeardView()

@end
@implementation TableHeardView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
    CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, wSize, 200)];
    [imageView setImage:[UIImage imageNamed:@"my_bg"]];
    [self addSubview:imageView];
    
    UIButton *button00 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button00.frame = CGRectMake(30, imageView.frame.size.height+5, 34, 34);
    [button00 setTitle:@"测试" forState:UIControlStateNormal];
    
    UIButton *button01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button01.frame = CGRectMake(30+104, imageView.frame.size.height+5, 34, 34);
    [button01 setTitle:@"测试" forState:UIControlStateNormal];
    
    UIButton *button02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button02.frame = CGRectMake(30+104*2, imageView.frame.size.height+5, 34, 34);
    [button02 setTitle:@"测试" forState:UIControlStateNormal];
    
    UIButton *button03 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button03.frame = CGRectMake(30+104*3, imageView.frame.size.height+5, 34, 34);
    [button03 setTitle:@"测试" forState:UIControlStateNormal];
    
    [self addSubview:button00];
    [self addSubview:button01];
    [self addSubview:button02];
    [self addSubview:button03];
    
    }
    return self;
}



@end
