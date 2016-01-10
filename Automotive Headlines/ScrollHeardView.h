//
//  ScrollHeardView.h
//  Automotive Headlines
//
//  Created by apple on 1/7/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewControllers.h"


@protocol ScorllImageViewDelegate <NSObject>

- (void)goToWebFromScrollImgV:(NSString *)url;

@end

@interface ScrollHeardView : UIView<UIScrollViewDelegate> {
    
    UILabel *_titleLable;
    
    NSString *_webUrlStr;
    
    NSArray *_dataArr;
    
    NSInteger _index;
}

@property (nonatomic,strong) UIViewController *viewController;


@property (nonatomic, strong) id<ScorllImageViewDelegate> delegate;

@property (nonatomic, strong) NSArray *arr;

- (void)scrollHeardViewUpdateWithArr:(NSArray *)arr;

@end
