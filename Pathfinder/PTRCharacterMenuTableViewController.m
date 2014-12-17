//
//  PTRCharacterMenuTableViewController.m
//  PathTracker
//
//  Created by Student on 12/16/14.
//
//

#import "PTRCharacterMenuTableViewController.h"
#import "PTRCharacter.h"
#import "PTRStatsTableViewController.h"
#import "PTRBioViewController.h"

@interface PTRCharacterMenuTableViewController ()

@property PTRCharacter *character;
@property NSArray *menuTitles;

@end

@implementation PTRCharacterMenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style character:(PTRCharacter *)character
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = character.characterName;
        self.character = character;
        self.menuTitles = @[@"Bio", @"Main Stats", @"Inventory", @"Skills"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = self.menuTitles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 1:
            [self.navigationController pushViewController:[[PTRStatsTableViewController alloc] initWithStyle:UITableViewStylePlain character:self.character] animated:YES];
            break;
        case 0:
            [self.navigationController pushViewController:[[PTRBioViewController alloc] initWithCharacter:self.character] animated:YES];
            break;
        default:
            break;
    }
}

@end

