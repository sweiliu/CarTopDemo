//
//  CustomButton01.m
//  Automotive Headlines
//
//  Created by apple on 1/11/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomButton01.h"

@implementation CustomButton01


- (CGRect)titleRectForContentRect:(CGRect)contentRect {

    return CGRectMake(5, 35, 25, 15);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect{

   return  CGRectMake(0, 0, 30, 30);
}

@end
