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
        UIView *componentsView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1000, 43.0)];
        self.components = [components mutableCopy];
        
        int entryNumber = 0;
        int widthTotal = 0;
        
        for (NSString *key in self.components)
        {
            NSNumber *currentComponent = [self.components objectForKey:key];
            UILabel *componentLabel = [[UILabel alloc] initWithFrame:CGRectMake(widthTotal + entryNumber * 10, 0.0, 0.0, 0.0)];
            [componentLabel setFont:[UIFont systemFontOfSize:11]];
            componentLabel.text = key;
            [componentLabel sizeToFit];
            UITextField *componentTextField = [[UITextField alloc] initWithFrame:CGRectMake((componentLabel.frame.size.width / 2) - 15 + widthTotal + entryNumber * 10, 13.0, 30.0, 30.0)];
            NSLog(@"%d", widthTotal);
            UILabel *additionLabel;
            widthTotal += componentLabel.frame.size.width;
            if (entryNumber < components.count - 1)
            {
                additionLabel = [[UILabel alloc] initWithFrame:CGRectMake(widthTotal + entryNumber * 10, 21.0, 11.0, 11.0)];
                additionLabel.text = @"+";
            }
            
            componentTextField.text = [currentComponent stringValue];
            
            componentLabel.adjustsFontSizeToFitWidth = NO;
            componentTextField.adjustsFontSizeToFitWidth = NO;
            additionLabel.adjustsFontSizeToFitWidth = NO;
            
            componentTextField.textAlignment = NSTextAlignmentCenter;
            componentTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            componentTextField.borderStyle = UITextBorderStyleRoundedRect;
            
            [componentTextField setFont:[UIFont systemFontOfSize:14]];
            [additionLabel setFont:[UIFont systemFontOfSize:14]];
            
            
            [componentsView addSubview:componentLabel];
            [componentsView addSubview:componentTextField];
            [componentsView addSubview:additionLabel];
            
            entryNumber++;
            
        }
        self.scrollView.contentSize = CGSizeMake(componentsView.frame.size.width, self.scrollView.frame.size.height);
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
