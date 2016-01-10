//
//  WebViewControllers.h
//  Automotive Headlines
//
//  Created by apple on 1/5/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewControllers : UIViewController

- (instancetype)initWithWebUrl:(NSString *)webUrl andBodyStr:(NSString *)bodyStr;

- (void)hidesTabBar:(BOOL)hidden;

@end
