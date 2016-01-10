//
//  CustomButton.m
//  Automotive Headlines
//
//  Created by apple on 1/4/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {

    return CGRectMake(0, 0, 25, 25);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(30, 5, 70, 16);
}

@end
