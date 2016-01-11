//
//  MineWebViewController.h
//  Automotive Headlines
//
//  Created by apple on 1/11/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineWebViewController : UIViewController
- (instancetype)initWithPost:(NSString *)postStr andBody:(NSString *)bodyStr;
- (instancetype)initWithGet:(NSString *)getStr;
@end
