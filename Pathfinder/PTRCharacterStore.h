//
//  BNRItemStore.h
//  Homeowner
//
//  Created by Mark Johnson on 8/18/14.
//  Copyright (c) 2014 Mark Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTRCharacter;

@interface PTRCharacterStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (PTRCharacter *)createItem;
- (void)removeItem:(PTRCharacter *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
