//
//  JCSSheetViewController.m
//  Pathfinder
//
//  Created by student on 11/13/14.
//
//

#import "JCSSheetViewController.h"

@interface JCSSheetViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *sheetView;

@end

@implementation JCSSheetViewController

//- (IBAction)alertButtonPushed:(id)sender
//{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Details" message:@"4 + 3 + 2 + 1" delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil];
//    [alert show];
//    
//}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Pathfinder";
    }
    return self;
}

- (UIView *)sheetView
{
    if (!_sheetView)
    {
        [[NSBundle mainBundle] loadNibNamed:@"SheetView" owner:self options:nil];
    }
    
    return _sheetView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)loadView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.navigationController.view.frame];
    [self.scrollView addSubview:self.sheetView];
    self.scrollView.contentSize = self.sheetView.frame.size;
    self.view = self.scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
