//
//  JCSFlipCell.m
//  Pathfinder
//
//  Created by student on 11/14/14.
//
//

#import "PTRFlipCell.h"

@interface PTRFlipCell()

@property (strong, nonatomic) IBOutlet UIView *frontView;
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (nonatomic) NSMutableDictionary *components;

@end

@implementation PTRFlipCell

-(instancetype)initWithTitle:(NSString *)title value:(NSNumber *)value componentDictionary:(NSDictionary *)components
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PTRFlipCell"];
    
    if(self)
    {
        NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"PTRFlipCell" owner:self options:nil];
        [self.contentView addSubview:nibViews[0]];
        [self.contentView addSubview:nibViews[1]];
        
        self.cellTitle.text = title;
        self.cellValue.text = [value stringValue];
        UIView *componentsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, components.count * 30.0 + (components.count - 1) * 20.0, 43.0)];
        self.components = [components mutableCopy];
        
        int entryNumber = 0;
        
        for (NSString *key in self.components)
        {
            NSNumber *currentComponent = [self.components objectForKey:key];
            UILabel *componentLabel = [[UILabel alloc] initWithFrame:CGRectMake(entryNumber * 50.0, 0.0, 43.0, 17.0)];
            UITextField *componentTextField = [[UITextField alloc] initWithFrame:CGRectMake(entryNumber * 50.0, 13.0, 30.0, 30.0)];
            UILabel *additionLabel;
            if (entryNumber < components.count - 1)
            {
                additionLabel = [[UILabel alloc] initWithFrame:CGRectMake(entryNumber * 50.0 + 34, 21.0, 11.0, 11.0)];
                additionLabel.text = @"+";
            }
            componentLabel.text = key;
            componentTextField.text = [currentComponent stringValue];
            
            componentLabel.adjustsFontSizeToFitWidth = NO;
            componentTextField.adjustsFontSizeToFitWidth = NO;
            additionLabel.adjustsFontSizeToFitWidth = NO;
            
            componentTextField.textAlignment = NSTextAlignmentCenter;
            componentTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            componentTextField.borderStyle = UITextBorderStyleRoundedRect;
            
            [componentLabel setFont:[UIFont systemFontOfSize:14]];
            [componentTextField setFont:[UIFont systemFontOfSize:14]];
            [additionLabel setFont:[UIFont systemFontOfSize:14]];
            
            
            [componentsView addSubview:componentLabel];
            [componentsView addSubview:componentTextField];
            [componentsView addSubview:additionLabel];
            
            entryNumber = entryNumber + 1;
            
        }
        self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:componentsView];
    }
    return self;
}


- (IBAction)flipToBack:(id)sender
{
    [UIView transitionWithView:self.contentView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{[self.contentView insertSubview:self.backView aboveSubview:self.frontView];} completion:^(BOOL finished){}];
}

- (IBAction)flipToFront:(id)sender
{
    [UIView transitionWithView:self.contentView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{[self.contentView insertSubview:self.frontView aboveSubview:self.backView];} completion:^(BOOL finished){}];
}

- (void)awakeFromNib
{
    // Initialization code
}

//These cells should not be selected or highlighted

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    return;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    return;
}


@end
