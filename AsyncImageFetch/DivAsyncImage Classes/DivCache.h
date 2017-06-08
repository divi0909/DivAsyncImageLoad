//
//  DivImageCache.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 05/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DivCache : NSObject

+(instancetype)sharedInstance;

/* 
    cache will be initialise with capacity of 50 object that can be configurable by setting value of maxObjectHoldCount
*/
@property(nonatomic) NSInteger maxObjectHoldCount;

/*
    Method to set data in cache for specified key
 */

-(void)setData:(NSData *)data ForKey:(NSString *)key;

/*
    Method to get data from cache for specified key
 */

-(NSData *)getDataForKey:(NSString *)key;

@end
