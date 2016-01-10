//
//  MineViewControllerCell.m
//  Automotive Headlines
//
//  Created by apple on 1/3/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MineViewControllerCell.h"

@implementation MineViewControllerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat wSize = [UIScreen mainScreen].bounds.size.width;
        
        self.photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 15, 15)];
        [self.contentView addSubview:self.photoImage];
        
        self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(35, 18, 80, 14)];
        self.titleLable.font = [UIFont systemFontOfSize:14.f];
        [self.contentView addSubview:self.titleLable];
        
        UIImageView *arrowImage = [[UIImageView alloc]initWithFrame:CGRectMake(wSize-17, 18, 10, 10)];
        [arrowImage setImage:[UIImage imageNamed:@"next"]];
        [self.contentView addSubview:arrowImage];
        
    }
    return self;
}

- (void)updateWithDic:(NSDictionary *)dic{

    [_photoImage setImage:[UIImage imageNamed:dic[@"img"]]];
    
    _titleLable.text = dic[@"title"];
}
@end
