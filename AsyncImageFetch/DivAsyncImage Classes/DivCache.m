//
//  DivImageCache.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "DivCache.h"

static DivCache *sharedInstance;

@interface DivCache()

@property(strong,nonatomic) NSCache *cacheImage;

@end

@implementation DivCache

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
        
        self.cacheImage = [NSCache new];
        
        // cache will be initialise with capacity of 50 object that can be configurable by setting value of maxObjectHoldCount
        
        self.cacheImage.countLimit = 50;
    }
    
    return self;
    
}

-(void)setMaxObjectHoldCount:(NSInteger)maxObjectHoldCount {
    
    self.cacheImage.countLimit = maxObjectHoldCount;
}


#pragma mark - Image Get And Set

-(void)setData:(NSData *)data ForKey:(NSString *)key {
    
    [self.cacheImage setObject:data forKey:key];
}

-(NSData *)getDataForKey:(NSString *)key {
    
    return [self.cacheImage objectForKey:key];
}

@end
