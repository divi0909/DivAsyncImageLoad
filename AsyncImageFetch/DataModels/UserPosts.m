//
//  UserPosts.m
//  AsyncImageFetch
//
//  Created by Divyanshu Sharma on 07/06/17.
//  Copyright © 2017 Divyanshu Sharma. All rights reserved.
//

#import "UserPosts.h"
#import "CommonFunctions.h"

@implementation UserPosts

-(instancetype)initWithDictionary:(NSDictionary *)info {
    self = [super init];
    
    if(self){
        
        info = [CommonFunctions dictionaryByReplacingNullsWithBlanks:info];
        
        self.userID = info[@"user"][@"id"];
        
        self.userName = info[@"name"];
        
        self.userProfileImage = [NSURL URLWithString:[info[@"profile_image"][@"medium"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        
        self.image = [NSURL URLWithString:[info[@"urls"][@"regular"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        
        self.width = [info[@"width"] intValue];
        self.height = [info[@"height"] intValue];
        
    }
    
    return self;
    
}

@end
