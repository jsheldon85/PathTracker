//
//  BNRItemStore.m
//  Homeowner
//
//  Created by Mark Johnson on 8/18/14.
//  Copyright (c) 2014 Mark Johnson. All rights reserved.
//

#import "PTRCharacterStore.h"
#import "PTRCharacter.h"

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
                                   reason:@"Use +[PTRCharacterStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self)
    {
        NSString *path = [self itemArchivePath];
        _privateItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!_privateItems)
        {
            _privateItems = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"items.archive"];
}

- (NSArray *)allItems {
    return self.privateItems;
}

- (PTRCharacter *)createItem {
    PTRCharacter *item = [[PTRCharacter alloc] init];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(PTRCharacter *)item {
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) return;
    PTRCharacter *item = self.privateItems[fromIndex];
    [self.privateItems removeObjectAtIndex:fromIndex];
    [self.privateItems insertObject:item atIndex:toIndex];
}

-(BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    return [NSKeyedArchiver archiveRootObject:self.privateItems toFile:path];
}

@end
