//
//  NavigationItemTitleView.h
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
@protocol NavigationItemTitleViewDelegate <NSObject>

- (void)tapBtn:(NSInteger)idx;
@end

@interface NavigationItemTitleView : UIView<UIScrollViewDelegate>


@property (nonatomic, weak) id<NavigationItemTitleViewDelegate> delegate;

@property (nonatomic, weak) UIViewController *pViewController;

@property (nonatomic,strong) UIView *scrollBarView;
- (void)updateTapBtn:(NSInteger)idx;

@end
