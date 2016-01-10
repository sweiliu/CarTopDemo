//
//  MineViewControllerCell.h
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewControllerCell : UITableViewCell

@property (nonatomic,strong) UIImageView *photoImage;
@property (nonatomic,strong) UILabel *titleLable;

- (void)updateWithDic:(NSDictionary *)dic;
@end
