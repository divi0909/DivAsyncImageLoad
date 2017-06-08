//
//  UIImageView+DivAsyncImageLoad.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "UIImageView+DivAsyncImageLoad.h"
#import "DivAsyncDownload.h"

@implementation UIImageView (DivAsyncImageLoad)

-(void)setImageWithUrl:(NSURL *)url placeHolder:(UIImage *)placeHolder {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:20];
    
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    
    [self setImageWithRequest:request placeHolder:placeHolder];
    
}

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder {
    
    [self setImageWithRequest:request placeHolder:placeHolder successHandler:nil failureHandler:nil];
    
}

-(void)setImageWithRequest:(NSURLRequest *)request placeHolder:(UIImage *)placeHolder successHandler:(SuccessHandler)successBlock failureHandler:(FailureHandler)failureBlock
{
    
    [[DivAsyncDownload sharedInstance] createDownloadTaskForRequest:request With:^(NSURLResponse *response, NSData *data,NSError *error) {
       
        if(error == nil) {
            
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            if(image) {
                
                self.image = image;
                
                if(successBlock){
                    
                    successBlock(image,response);
                    
                }
                
            }
            
        }
        else {
            
            failureBlock(error,response);
            
        }
        
    }];
}

-(void)cancelImageDownloadForUrl:(NSURL *)url {
    
    [[DivAsyncDownload sharedInstance] cancelDownloadTaskForUrl:url];
    
}

@end
