//
//  UIImageView+DivAsyncImageLoad.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessHandler)(UIImage *image,NSURLResponse *response);

typedef void(^FailureHandler)(NSError *error,NSURLResponse *response);

@interface UIImageView (DivAsyncImageLoad)

-(void)setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder;

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder;

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder successHandler:(SuccessHandler)successBlock failureHandler:(FailureHandler)failureBlock;

-(void)cancelImageDownloadForUrl:(NSURL *)url;

@end
