//
//  DivAsync.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DivAsyncDownload : NSObject

typedef void(^CompletionHandler)(NSURLResponse *response,NSData *data,NSError *error);

+(instancetype)sharedInstance;

/* A dictionary that hold blocks of download method
    
   if same request made for fetching resource then it avoids to send duplicate requests
 
 */
@property(strong,nonatomic) NSMutableDictionary *dictCurrentRequests;


-(void)createDownloadTaskForRequest:(NSURLRequest *)request With:(CompletionHandler)completionHandler;

-(void)cancelDownloadTaskForUrl:(NSURL *)url;

@end
