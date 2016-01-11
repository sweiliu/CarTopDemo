//
//  TableHeardView.h
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tableHeatdViewDelegate <NSObject>

- (void)shallowLable:(BOOL)BL;

@end

@interface TableHeardView : UIView
@property (nonatomic,weak) UIViewController *pViewController;
@property (nonatomic,strong) id<tableHeatdViewDelegate> delegate;
@end
