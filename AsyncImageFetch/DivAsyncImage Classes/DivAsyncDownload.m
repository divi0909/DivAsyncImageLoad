//
//  DivAsync.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "DivAsyncDownload.h"
#import "DivCache.h"

static DivAsyncDownload *sharedInstance;

@implementation DivAsyncDownload

+(instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
}

-(instancetype)init {
    
    self = [super init];
    
    if(self) {
        
        self.dictCurrentRequests = [NSMutableDictionary new];
    }
    
    return self;
    
}

-(void)createDownloadTaskForRequest:(NSURLRequest *)request With:(CompletionHandler)completionHandler {
    
    if(!request)
        assert("A Http call can not be made without request");
    
    
    if([[DivCache sharedInstance] getDataForKey:request.URL.absoluteString].length > 0) {
        
        completionHandler(nil,[[DivCache sharedInstance] getDataForKey:request.URL.absoluteString],nil);
        
        return;
    }
        
    if(_dictCurrentRequests[request.URL.absoluteString]) {
        
        [_dictCurrentRequests[request.URL.absoluteString] addObject:completionHandler];
    }
    else {
        
        NSMutableSet *setCompletionHandler = [[NSMutableSet alloc] initWithObjects:completionHandler, nil];
        
        [_dictCurrentRequests setObject:setCompletionHandler forKey:request.URL.absoluteString];
        
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           
                if(error == nil && data.length > 0) {
                    
                        [[DivCache sharedInstance] setData:data ForKey:request.URL.absoluteString];
                    
                }
            
            [(NSSet *)_dictCurrentRequests[request.URL.absoluteString] enumerateObjectsUsingBlock:^(CompletionHandler handler, BOOL * _Nonnull stop) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   
                    handler(response,data,error);
                    
                });
                
            }];
            
            [_dictCurrentRequests removeObjectForKey:request.URL.absoluteString];
            
        }];
        
        [downloadTask resume];
        
    }
    
    
}

-(void)cancelDownloadTaskForUrl:(NSURL *)url{
    
    [[NSURLSession sharedSession] getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        
        for(NSURLSessionDataTask *dataTask in dataTasks){
            
            if([dataTask.originalRequest.URL.absoluteString isEqualToString:url.absoluteString]){
                
                [dataTask cancel];
                
                [self.dictCurrentRequests removeObjectForKey:url.absoluteString];
                
                break;
                
            }
            
        }
        
        
    }];
}


#pragma mark - Private Methods

+(NSURLSessionConfiguration *)getSessionConfiguration {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration new];
    
    configuration.timeoutIntervalForRequest = 30;
    configuration.timeoutIntervalForResource = 30;
    
    return configuration;
}

@end
