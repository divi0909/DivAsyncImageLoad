//
//  UserPosts.h
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 07/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserPosts : NSObject

@property(strong,nonatomic) NSString *userName,*userID;

@property(strong,nonatomic) NSURL *userProfileImage;

@property(strong,nonatomic) NSURL *image;

@property(nonatomic) int width,height;

-(instancetype)initWithDictionary:(NSDictionary *)info;

@end
