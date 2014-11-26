//
//  BNRItemStore.m
//  Homeowner
//
//  Created by Mark Johnson on 8/18/14.
//  Copyright (c) 2014 Mark Johnson. All rights reserved.
//

#import "PTRCharacterStore.h"

@interface PTRCharacterStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation PTRCharacterStore

+ (instancetype)sharedStore {
    static PTRCharacterStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[PTRCharacterStore alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate {
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems {
    return self.privateItems;
}

- (PTRCharacter *)createItem {
    PTRCharacter *item = [PTRCharacter emptyItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item {
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) return;
    BNRItem *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
