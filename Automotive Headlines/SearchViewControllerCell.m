//
//  SearchViewControllerCell.m
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "SearchViewControllerCell.h"

@implementation SearchViewControllerCell

{
    NSString *_leftUrl;
    NSString *_centerUrl;
    NSString *_rightUrl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self addViews];
        
    }
    return self;
}

- (void)updateWithDic:(NSDictionary *)dic {

    _leftUrl = dic[@"leftButtonUrl"];
    _centerUrl = dic[@"centerButtonUrl"];
    _rightUrl = dic[@"rightButton"];
    
    [_leftButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",dic[@"leftImg"]]] forState:UIControlStateNormal];
    [_leftButton setTitle:[NSString stringWithFormat:@"%@",dic[@"leftTitle"]] forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_centerButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",dic[@"centerImg"]]] forState:UIControlStateNormal];
    [_centerButton setTitle:[NSString stringWithFormat:@"%@",dic[@"centerTitle"]] forState:UIControlStateNormal];
    [_centerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [_rightButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",dic[@"rightImg"]]] forState:UIControlStateNormal];
    [_rightButton setTitle:[NSString stringWithFormat:@"%@",dic[@"rightTitle"]] forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
}

- (void)addViews {

    _leftButton = [CustomButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(7, 7, 100, 25);
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_leftButton];
    [_leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    
    _centerButton = [CustomButton buttonWithType:UIButtonTypeCustom];
    _centerButton.frame = CGRectMake(135, 7, 100, 25);
    _centerButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_centerButton];
    [_centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _rightButton = [CustomButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(265, 7, 100, 25);
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_rightButton];
    [_rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)leftButtonAction:(CustomButton *)btn {
    
    SearchWebViewController *view = [[SearchWebViewController alloc]initWithLeftButtonWebUrl:_leftUrl andCenterButtonUrl:nil andRightButtonUrl:nil];
    [_webViewController.navigationController pushViewController:view animated:YES];
    
}

- (void)centerButtonAction:(CustomButton *)btn {
    
    SearchWebViewController *view = [[SearchWebViewController alloc]initWithLeftButtonWebUrl:nil andCenterButtonUrl:_centerUrl andRightButtonUrl:nil];
    [_webViewController.navigationController pushViewController:view animated:YES];
    
}

- (void)rightButtonAction:(CustomButton *)btn {
    
    SearchWebViewController *view = [[SearchWebViewController alloc]initWithLeftButtonWebUrl:nil andCenterButtonUrl:nil andRightButtonUrl:_rightUrl];
    [_webViewController.navigationController pushViewController:view animated:YES];
}

- (void)setFrame {
    
    
    
}



@end
