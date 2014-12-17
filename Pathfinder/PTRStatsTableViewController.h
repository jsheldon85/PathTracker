//
//  PTRStatsTableViewController.h
//  PathTracker
//
//  Created by Student on 12/3/14.
//
//

#import <UIKit/UIKit.h>
@class PTRCharacter;

@interface PTRStatsTableViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style character:(PTRCharacter *)character;

@end
