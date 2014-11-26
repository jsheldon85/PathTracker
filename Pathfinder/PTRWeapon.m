//
//  PTRWeapon.m
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import "PTRWeapon.h"

@implementation PTRWeapon

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _attackBonus = [aDecoder decodeIntForKey:@"attackBonus"];
        _critical = [aDecoder decodeIntForKey:@"critical"];
        _range = [aDecoder decodeIntForKey:@"range"];
        _ammunition = [aDecoder decodeIntForKey:@"ammunition"];
        _damage = [aDecoder decodeIntForKey:@"damage"];
        _type = [aDecoder decodeObjectForKey:@"type"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.attackBonus forKey:@"attackBonus"];
    [aCoder encodeInt:self.critical forKey:@"critical"];
    [aCoder encodeInt:self.range forKey:@"range"];
    [aCoder encodeInt:self.ammunition forKey:@"ammunition"];
    [aCoder encodeInt:self.damage forKey:@"damage"];
    [aCoder encodeObject:self.type forKey:@"type"];
}

@end
