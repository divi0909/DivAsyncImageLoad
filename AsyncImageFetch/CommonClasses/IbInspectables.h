//
//  IbInspectables.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 07/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomImageView : UIImageView

@property(nonatomic) IBInspectable CGFloat cornerRadius;

@property(nonatomic) IBInspectable CGFloat borderWidth;

@property(nonatomic) IBInspectable UIColor *borderColor;

@end
