//
//  NavigationItemTitleView.m
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "NavigationItemTitleView.h"

#define W_SIZE [UIScreen mainScreen].bounds.size.width
@implementation NavigationItemTitleView
{
    UIScrollView *_buttonScrollView;
}
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        
        UIScrollView *buttonScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE-35, 44)];
        buttonScrollView.backgroundColor = [UIColor clearColor];
        buttonScrollView.showsVerticalScrollIndicator = NO;
//        buttonScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:buttonScrollView];
        buttonScrollView.contentSize = CGSizeMake(90*6+28, 0);
        buttonScrollView.delegate = self;
        _buttonScrollView = buttonScrollView;
        
        
        NSArray *lableArr = @[@"头条",@"新车",@"行业",@"导购",@"用车",@"头条客"];
        CGFloat x = 0;
        for (NSInteger index = 1; index < lableArr.count+1; index++) {
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(x+28, 10, 50, 20)];
            [buttonScrollView addSubview:button];
            [button setTitle:lableArr[index-1] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(goToAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 1000+index;
            x = 90*index;
        }
        
        UIImageView *searchImageView = [[UIImageView alloc]initWithFrame:CGRectMake(W_SIZE-35, 0, 35, 40)];
        searchImageView.userInteractionEnabled = YES;
        searchImageView.image = [UIImage imageNamed:@"fenleisousuo"];
        [self addSubview:searchImageView];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushSearchViewController)];
        [searchImageView addGestureRecognizer:tapGesture];
        
    }
    return self;
}

- (void)pushSearchViewController {
    NSLog(@"进入搜索");
    SearchViewController *view = [[SearchViewController alloc]init];
    
    [_pViewController.navigationController pushViewController:view animated:YES];
    
}

- (void)goToAction:(UIButton *)btn {
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    NSLog(@"点击了第 %lu 个按钮",btn.tag-1000);
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapBtn:)]) {
        [self.delegate tapBtn:btn.tag - 1001];
    }
}

- (void)updateTapBtn:(NSInteger)idx {
    UIButton *btn = (UIButton *)[self viewWithTag:1001 + idx];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [_buttonScrollView setContentOffset:CGPointMake(idx*80, 0) animated:YES];
}
@end