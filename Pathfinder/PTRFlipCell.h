//
//  JCSFlipCell.h
//  Pathfinder
//
//  Created by student on 11/14/14.
//
//

#import <UIKit/UIKit.h>

@interface PTRFlipCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitle;
@property (weak, nonatomic) IBOutlet UILabel *cellValue;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

-(instancetype)initWithTitle:(NSString *)title value:(NSNumber *)value componentDictionary:(NSDictionary *)components;


@end
