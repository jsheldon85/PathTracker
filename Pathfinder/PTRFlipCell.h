//
//  JCSFlipCell.h
//  Pathfinder
//
//  Created by student on 11/14/14.
//
//

#import <UIKit/UIKit.h>
@class PTRStatsTableViewController;

@interface PTRFlipCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellValue;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

-(instancetype)initWithTitle:(NSString *)title componentDictionary:(NSMutableDictionary *)components viewController:(PTRStatsTableViewController *)vc;


@end
