
#import "CommonFunctions.h"

@implementation CommonFunctions


+ (NSArray *)arrayByReplacingNullsWithBlanks:(NSArray *)array
{
    
    NSMutableArray *replaced = [array mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul)
        {
            [replaced replaceObjectAtIndex:idx withObject:blank];
        }
        else if ([object isKindOfClass:[NSDictionary class]])
        {
            [replaced replaceObjectAtIndex:idx withObject:[CommonFunctions dictionaryByReplacingNullsWithBlanks:object]];
        }
        else if ([object isKindOfClass:[NSArray class]])
        {
            [replaced replaceObjectAtIndex:idx withObject:[CommonFunctions arrayByReplacingNullsWithBlanks:array]];
        }
    }
    return [replaced copy];
    
}
+ (NSDictionary *)dictionaryByReplacingNullsWithBlanks:(NSDictionary *)dictionary
{
    const NSMutableDictionary *replaced = [dictionary mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in dictionary)
    {
        id object = [dictionary objectForKey:key];
        if (object == nul)
        {
            [replaced setObject:blank forKey:key];
        }
        else if ([object isKindOfClass:[NSDictionary class]])
        {
            [replaced setObject:[CommonFunctions dictionaryByReplacingNullsWithBlanks:object] forKey:key];
        }
        else if ([object isKindOfClass:[NSArray class]])
        {
            [replaced setObject:[CommonFunctions arrayByReplacingNullsWithBlanks:object] forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end
