//
//  IbInspectables.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 07/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "IbInspectables.h"

@implementation CustomImageView

-(void)setCornerRadius:(CGFloat)cornerRadius{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = true;
    
}

-(void)setBorderColor:(UIColor *)borderColor{
    
    self.layer.borderColor = borderColor.CGColor;
    
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    
    self.layer.borderWidth = borderWidth;
}

@end
