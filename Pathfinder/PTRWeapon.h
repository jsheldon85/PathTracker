//
//  PTRWeapon.h
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import <Foundation/Foundation.h>
#import "PTRItem.h"

@interface PTRWeapon : PTRItem <NSCoding>

@property (nonatomic) int attackBonus;
@property (nonatomic) int critical;
@property (nonatomic) NSString *type;
@property (nonatomic) int range;
@property (nonatomic) int ammunition;
@property (nonatomic) int damage;

@end
