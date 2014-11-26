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

@end

@implementation PTRFlipCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    NSArray *nibViews = [[NSBundle mainBundle] loadNibNamed:@"PTRFlipCell" owner:self options:nil];
    [self.contentView addSubview:nibViews[0]];
    [self.contentView addSubview:nibViews[1]];
    return self;
}

@end
