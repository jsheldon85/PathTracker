//
//  PTRCharactersTableViewController.m
//  PathTracker
//
//  Created by Student on 12/16/14.
//
//

#import "PTRCharactersTableViewController.h"
#import "PTRCharacterStore.h"
#import "PTRStatsTableViewController.h"
#import "PTRCharacter.h"
#import "PTRCharacterMenuTableViewController.h"
#import "PTRBioViewController.h"

@interface PTRCharactersTableViewController ()

@end

@implementation PTRCharactersTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"PathTracker";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCharacter:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEditingMode:)];
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
    return [[PTRCharacterStore sharedStore] allItems].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    PTRCharacter *character = [[PTRCharacterStore sharedStore] allItems][indexPath.row];
    cell.textLabel.text = character.characterName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PTRCharacter *character = [[PTRCharacterStore sharedStore] allItems][indexPath.row];
    [self.navigationController pushViewController:[[PTRCharacterMenuTableViewController alloc] initWithStyle:UITableViewStylePlain character:character] animated:YES];
}

-(void)addCharacter:(id)sender
{
    [[PTRCharacterStore sharedStore] createItem];
    [self.navigationController pushViewController:[[PTRBioViewController alloc] initWithCharacter:[[[PTRCharacterStore sharedStore] allItems] lastObject]] animated:YES];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSArray *characters = [[PTRCharacterStore sharedStore] allItems];
        PTRCharacter *character = characters[indexPath.row];
        [[PTRCharacterStore sharedStore] removeItem:character];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

-(void)toggleEditingMode:(UIBarButtonItem *)sender
{
    if(self.isEditing)
    {
        [sender setTitle:@"Edit"];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done"];
        [self setEditing:YES animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[PTRCharacterStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

@end