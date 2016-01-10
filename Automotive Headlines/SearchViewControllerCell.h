//
//  SearchViewControllerCell.h
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
#import "SearchWebViewController.h"

@interface SearchViewControllerCell : UITableViewCell

@property (nonatomic,strong) CustomButton *leftButton;
@property (nonatomic,strong) CustomButton *centerButton;
@property (nonatomic,strong) CustomButton *rightButton;


@property (nonatomic,strong) UIViewController *webViewController;
- (void)updateWithDic:(NSDictionary *)dic;

@end
