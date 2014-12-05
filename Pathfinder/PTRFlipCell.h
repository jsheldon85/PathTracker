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
@property (weak, nonatomic) IBOutlet UILabel *val1Label;
@property (weak, nonatomic) IBOutlet UITextField *val1TextField;
@property (weak, nonatomic) IBOutlet UILabel *val2Label;
@property (weak, nonatomic) IBOutlet UITextField *val2TextField;
@property (weak, nonatomic) IBOutlet UILabel *val3Label;
@property (weak, nonatomic) IBOutlet UITextField *val3TextField;
@property (weak, nonatomic) IBOutlet UILabel *val4Label;
@property (weak, nonatomic) IBOutlet UITextField *val4TextField;

-(instancetype)initWithTitle:(NSString *)title value:(NSNumber *)value valueComponents:(NSArray *)vals;


@end
