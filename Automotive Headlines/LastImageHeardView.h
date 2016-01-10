//
//  LastImageHeardView.h
//  Automotive Headlines
//
//  Created by apple on 1/8/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewControllers.h"

@interface LastImageHeatView : UIView {
    
    UIImageView *_imageView;
    
    UILabel *_titleLable;
    
    NSString *_bodyStr;
    
    NSArray *_dataArr;
}
@property (nonatomic,strong) UIViewController *viewController;

- (void)imageHeardViewUpdateWithArr:(NSArray *)arr;

@end
