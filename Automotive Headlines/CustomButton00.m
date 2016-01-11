//
//  CustomButton00.m
//  Automotive Headlines
//
//  Created by apple on 1/11/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomButton00.h"

@implementation CustomButton00

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 65, self.frame.size.width, 15);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {

    
    return CGRectMake(0, 0, self.frame.size.width, 50);
    
}
@end
