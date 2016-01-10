//
//  ViewControllers.h
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllers : UIViewController

@property (nonatomic,strong) UILabel *titleLable;
@property (nonatomic,strong) UIImageView *tableHearView;

- (void)tableViewDataWithStr:(NSString *)dataStr andTableHeardViewImage:(NSString *)imageStr;

@end
