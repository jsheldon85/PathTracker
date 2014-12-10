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
        
        self.components = [components mutableCopy];
        
        for (NSString *key in self.components)
        {
            NSNumber *currentComponent = [self.components objectForKey:key];
            
        }
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
