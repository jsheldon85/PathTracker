//
//  PTRItem.h
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import <Foundation/Foundation.h>

@interface PTRItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;

-(instancetype)initWithDetails;

@end
