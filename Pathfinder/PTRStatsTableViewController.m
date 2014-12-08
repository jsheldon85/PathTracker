//
//  PTRStatsTableViewController.m
//  PathTracker
//
//  Created by Student on 12/3/14.
//
//

#import "PTRStatsTableViewController.h"
#import "PTRFlipCell.h"

@interface PTRStatsTableViewController ()

@property NSMutableArray *titleArray;
@property NSMutableArray *valueArray;


@end

@implementation PTRStatsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.navigationItem.title = @"PathTracker";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //add vals
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"CMD",@"CMB", @"Dexterity", @"Strength", @"Intelligence", @"Constitution", nil];
    self.valueArray = [[NSMutableArray alloc] initWithObjects:@8,@13,@13,@10,@17,@14,nil];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.titleArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PTRFlipCell"];
    if(cell == nil)
    {
        cell = [[PTRFlipCell alloc] initWithTitle:[self.titleArray objectAtIndex:indexPath.row]  value:[self.valueArray objectAtIndex:indexPath.row] componentDictionary:nil];
    }
    
    return cell;
}

@end
