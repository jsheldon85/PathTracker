//
//  PTRBioViewController.m
//  PathTracker
//
//  Created by Student on 12/16/14.
//
//

#import "PTRBioViewController.h"
#import "PTRCharacter.h"
#import "PTRCharacterStore.h"

@interface PTRBioViewController ()

@property PTRCharacter *character;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *bioView;

//UITextField IBOutlets-------------------------------------------------

//Strings
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *alignmentField;
@property (weak, nonatomic) IBOutlet UITextField *playerField;
@property (weak, nonatomic) IBOutlet UITextField *classField;
@property (weak, nonatomic) IBOutlet UITextField *dietyField;
@property (weak, nonatomic) IBOutlet UITextField *homelandField;
@property (weak, nonatomic) IBOutlet UITextField *raceField;
@property (weak, nonatomic) IBOutlet UITextField *sizeField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *hairField;
@property (weak, nonatomic) IBOutlet UITextField *eyesField;

//Ints
@property (weak, nonatomic) IBOutlet UITextField *levelField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *HPField;
@property (weak, nonatomic) IBOutlet UITextField *speedField;
@property (weak, nonatomic) IBOutlet UITextField *BABField;
@property (weak, nonatomic) IBOutlet UITextField *spellResistanceField;

//----------------------------------------------------------------------

@end

@implementation PTRBioViewController

-(instancetype)init
{
    return [self initWithCharacter:nil];
}

-(instancetype)initWithCharacter:(PTRCharacter *)character
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self)
    {
        self.character = character;
        self.navigationItem.title = [NSString stringWithFormat:@"%@: Bio", character.characterName];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameField.text = self.character.characterName;
    self.alignmentField.text = self.character.aligment;
    self.playerField.text = self.character.player;
    self.classField.text = self.character.characterClass;
    self.dietyField.text = self.character.diety;
    self.homelandField.text = self.character.homeland;
    self.raceField.text = self.character.race;
    self.sizeField.text = self.character.size;
    self.genderField.text = self.character.gender;
    self.hairField.text = self.character.hair;
    self.eyesField.text = self.character.eyes;
    
    self.levelField.text = [self.character.characterLevel stringValue];
    self.ageField.text = [self.character.age stringValue];
    self.heightField.text = [self.character.height stringValue];
    self.weightField.text = [self.character.weight stringValue];
    self.HPField.text = [self.character.hp stringValue];
    self.speedField.text = [self.character.speed stringValue];
    self.BABField.text = [self.character.baseAttackBonus stringValue];
    self.spellResistanceField.text = [self.character.spellResistance stringValue];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.scrollView.contentSize = self.bioView.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.character.characterName = self.nameField.text;
    self.character.aligment = self.alignmentField.text;
    self.character.player = self.playerField.text;
    self.character.characterClass = self.classField.text;
    self.character.diety = self.dietyField.text;
    self.character.homeland = self.homelandField.text;
    self.character.race = self.raceField.text;
    self.character.size = self.sizeField.text;
    self.character.gender = self.genderField.text;
    self.character.hair = self.hairField.text;
    self.character.eyes = self.eyesField.text;
    
    self.character.characterLevel = [NSNumber numberWithInt:[self.levelField.text intValue]];
    self.character.age = [NSNumber numberWithInt:[self.ageField.text intValue]];
    self.character.height = [NSNumber numberWithInt:[self.heightField.text intValue]];
    self.character.weight = [NSNumber numberWithInt:[self.weightField.text intValue]];
    self.character.hp = [NSNumber numberWithInt:[self.HPField.text intValue]];
    self.character.speed = [NSNumber numberWithInt:[self.speedField.text intValue]];
    self.character.baseAttackBonus = [NSNumber numberWithInt:[self.BABField.text intValue]];
    self.character.spellResistance = [NSNumber numberWithInt:[self.spellResistanceField.text intValue]];
    
    [[PTRCharacterStore sharedStore] saveChanges];
}

@end
