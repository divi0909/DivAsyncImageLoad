//
//  Webservices.h
//
//
//  Created by Divyanshu Sharma on 28/04/16.
//  Copyright © 2016 Octal Info Solution. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonFunctions : NSObject

+ (NSArray *)arrayByReplacingNullsWithBlanks:(NSArray *)array;

+ (NSDictionary *)dictionaryByReplacingNullsWithBlanks:(NSDictionary *)dictionary;

@end
