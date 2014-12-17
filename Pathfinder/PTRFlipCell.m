//
//  JCSFlipCell.m
//  Pathfinder
//
//  Created by student on 11/14/14.
//
//

#import "PTRFlipCell.h"
#import "PTRStatsTableViewController.h"
#import "PTRCharacterStore.h"

@interface PTRFlipCell()

@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (nonatomic) NSMutableDictionary *components;
@property (weak) PTRStatsTableViewController *tableViewController;
@property (weak, nonatomic) IBOutlet UITextField *totalField;

@property NSNumber *total;

@end

@implementation PTRFlipCell

-(instancetype)initWithTitle:(NSString *)title componentDictionary:(NSMutableDictionary *)components viewController:(PTRStatsTableViewController *)vc
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PTRFlipCell"];
    self.tableViewController = vc;
    
    if(self)
    {
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"PTRFlipCell" owner:self options:nil];
        [self.contentView addSubview:nibViews[0]];
        [self.contentView addSubview:nibViews[1]];
        
        self.cellTitle.text = title;

        UIView *componentsView = [[UIView alloc] init];
        self.components = components;
        
        self.total = [self dictionarySum:self.components];
        self.cellValue.text = [self.total stringValue];
        
        int entryNumber = 0;
        int widthTotal = 0;
        
        for (NSString *key in self.components)
        {
            NSNumber *currentComponent = [self.components objectForKey:key];
            
            UILabel *componentLabel = [[UILabel alloc] initWithFrame:CGRectMake(widthTotal + entryNumber * 10.0, 0.0, 0.0, 0.0)];
            [componentLabel setFont:[UIFont systemFontOfSize:11]];
            componentLabel.text = key;
            [componentLabel sizeToFit];
            componentLabel.tag = entryNumber * 2 + 1;   //Label will have the tag of the corresponding text field + 1
            
            UITextField *componentTextField = [[UITextField alloc] initWithFrame:CGRectMake((componentLabel.frame.size.width / 2) - 15 + widthTotal + entryNumber * 10, 13.0, 30.0, 30.0)];
            NSLog(@"%d", widthTotal);
            UILabel *additionLabel;
            
            widthTotal += componentLabel.frame.size.width;
            
            if (entryNumber < components.count - 1)
            {
                additionLabel = [[UILabel alloc] initWithFrame:CGRectMake(widthTotal + entryNumber * 10.0, 21.0, 11.0, 11.0)];
                additionLabel.text = @"+";
            }
            
            componentTextField.text = [currentComponent stringValue];
            componentTextField.delegate = self;
            componentTextField.tag = entryNumber * 2;
            
            componentLabel.adjustsFontSizeToFitWidth = NO;
            componentTextField.adjustsFontSizeToFitWidth = NO;
            additionLabel.adjustsFontSizeToFitWidth = NO;
            
            componentTextField.textAlignment = NSTextAlignmentCenter;
            componentTextField.borderStyle = UITextBorderStyleRoundedRect;
            
            [componentTextField setFont:[UIFont systemFontOfSize:14]];
            [additionLabel setFont:[UIFont systemFontOfSize:14]];
            
            
            [componentsView addSubview:componentLabel];
            [componentsView addSubview:componentTextField];
            [componentsView addSubview:additionLabel];
            
            
            entryNumber++;
            
        }
        [componentsView setFrame:CGRectMake(0.0, 0.0, widthTotal + entryNumber * 10, 43)];
        self.scrollView.contentSize = CGSizeMake(componentsView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:componentsView];
    }
    return self;
}


- (IBAction)flipToBack:(id)sender
{
    self.totalField.text = [self.total stringValue];
    [UIView transitionWithView:self.contentView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{[self.contentView insertSubview:self.backView aboveSubview:self.frontView];} completion:^(BOOL finished){}];
}

- (IBAction)flipToFront:(id)sender
{
    self.cellValue.text = [self.total stringValue];
    [UIView transitionWithView:self.contentView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{[self.contentView insertSubview:self.frontView aboveSubview:self.backView];} completion:^(BOOL finished){}];
}

- (void)awakeFromNib
{
    self.totalField.text = [self.total stringValue];
}

//These cells should not be selected or highlighted--------------

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    return;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    return;
}

//--------------------------------------------------------------

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    int labelTag = textField.tag + 1;
    UILabel *label = [self.scrollView viewWithTag:labelTag];
    [self.components setObject:[NSNumber numberWithInt:[textField.text intValue]] forKey:label.text];
    [[PTRCharacterStore sharedStore] saveChanges];
    self.total = [self dictionarySum:self.components];
    self.totalField.text = [self.total stringValue];
    return YES;
}

-(NSNumber *)dictionarySum:(NSMutableDictionary *)dictionary
{
    int sum = 0;
    for (NSString *key in self.components)
    {
        NSNumber *currentComponent = [self.components objectForKey:key];
        sum = sum + [currentComponent intValue];
    }
    return [NSNumber numberWithInt:sum];
}

@end
