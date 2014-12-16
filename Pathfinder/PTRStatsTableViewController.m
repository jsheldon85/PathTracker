//
//  PTRStatsTableViewController.m
//  PathTracker
//
//  Created by Student on 12/3/14.
//
//

#import "PTRStatsTableViewController.h"
#import "PTRFlipCell.h"
#import "PTRCharacter.h"

@interface PTRStatsTableViewController ()

@property NSMutableArray *titleArray;
@property NSMutableArray *valueArray;
@property NSMutableArray *componentsArray;
@property PTRCharacter *character;


@end

@implementation PTRStatsTableViewController

- (id)init
{
    return [self initWithStyle:UITableViewStylePlain character:nil];
}

- (id)initWithStyle:(UITableViewStyle)style character:(PTRCharacter *)character
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.character = character;

        self.navigationItem.title = @"PathTracker";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"Dexterity", @"Strength", @"Intelligence", @"Constitution", nil];
    self.valueArray = [[NSMutableArray alloc] initWithObjects:@13,@10,@17,@14,nil];
    self.componentsArray = [[NSMutableArray alloc] initWithObjects:self.character.fortitude, self.character.strength, self.character.intelligence, self.character.constitution, nil];
    
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
        cell = [[PTRFlipCell alloc] initWithTitle:[self.titleArray objectAtIndex:indexPath.row]  value:[self.valueArray objectAtIndex:indexPath.row] componentDictionary:[self.componentsArray objectAtIndex:indexPath.row] viewController:self];
    }
    
    return cell;
}



@end
