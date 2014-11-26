//
//  PTRItem.m
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import "PTRItem.h"

@implementation PTRItem

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _description = [aDecoder decodeObjectForKey:@"description"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.description forKey:@"description"];
}

@end
