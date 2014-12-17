//
//  PTRCharacter.m
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import "PTRCharacter.h"

@implementation PTRCharacter

-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        
        //Initialize Abilities
        

        self.strength = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.dexterity = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.intelligence = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.wisdom = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.charisma = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.constitution = [@{ @"Ability Score" : @0,
                            @"Ability Modifier" : @0,
                            @"Temp Adjustment" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        //Initialize Saving Throws
        
        self.fortitude = [@{@"Base Save" : @0,
                            @"Ability Modifier" : @0,
                            @"Magic Modifier" : @0,
                            @"Misc Modifier" : @0,
                            @"Temp Modifier" : @0 } mutableCopy];
            
        self.reflex = [@{@"Base Save" : @0,
                         @"Ability Modifier" : @0,
                         @"Magic Modifier" : @0,
                         @"Misc Modifier" : @0,
                         @"Temp Modifier" : @0 } mutableCopy];
            
        self.will = [@{@"Base Save" : @0,
                       @"Ability Modifier" : @0,
                       @"Magic Modifier" : @0,
                       @"Misc Modifier" : @0,
                       @"Temp Modifier" : @0 } mutableCopy];
        
        //Initialize Combat Stats
        
        self.initiative = [@{@"Total": @0,
                             @"Dex Modifier" : @0,
                             @"Misc Modifier" : @0 } mutableCopy];
        
        self.CMB = [@{@"Total": @0,
                      @"Base Attack Bonus" : @0,
                      @"Strength Modifier" : @0,
                      @"Size Modifier" : @0 } mutableCopy];
        
        self.CMD = [@{@"Total": @0,
                      @"Base Attack Bonus" : @0,
                      @"Strength Modifier" : @0,
                      @"Dexterity Modifier" : @0,
                      @"Size Modifier" : @0 } mutableCopy];
        
        
        self.armorClass = [@{@"Total" : @0,
                             @"Armor Bonus" : @0,
                             @"Shield Bonus" : @0,
                             @"Dex Modifier" : @0,
                             @"Size Modifier" : @0,
                             @"Natural Armor" : @0,
                             @"Deflection Modifier" : @0,
                             @"Misc Modifier" : @0 } mutableCopy];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _characterName = [aDecoder decodeObjectForKey:@"characterName"];
        _aligment = [aDecoder decodeObjectForKey:@"alignment"];
        _player = [aDecoder decodeObjectForKey:@"player"];
        _characterClass = [aDecoder decodeObjectForKey:@"characterClass"];
        _diety = [aDecoder decodeObjectForKey:@"diety"];
        _homeland = [aDecoder decodeObjectForKey:@"homeland"];
        _race = [aDecoder decodeObjectForKey:@"race"];
        _size = [aDecoder decodeObjectForKey:@"size"];
        _gender = [aDecoder decodeObjectForKey:@"gender"];
        _hair = [aDecoder decodeObjectForKey:@"hair"];
        _eyes = [aDecoder decodeObjectForKey:@"eyes"];
        
        _languages = [aDecoder decodeObjectForKey:@"languages"];
        _inventory = [aDecoder decodeObjectForKey:@"inventory"];
        
        _characterLevel = [aDecoder decodeObjectForKey:@"characterLevel"];
        _age = [aDecoder decodeObjectForKey:@"age"];
        _height = [aDecoder decodeObjectForKey:@"height"];
        _weight = [aDecoder decodeObjectForKey:@"weight"];
        _hp = [aDecoder decodeObjectForKey:@"hp"];
        _speed = [aDecoder decodeObjectForKey:@"speed"];
        _baseAttackBonus = [aDecoder decodeObjectForKey:@"baseAttackBonus"];
        _spellResistance = [aDecoder decodeObjectForKey:@"spellResistance"];
        
        _strength = [aDecoder decodeObjectForKey:@"strength"];
        _dexterity = [aDecoder decodeObjectForKey:@"dexterity"];
        _constitution = [aDecoder decodeObjectForKey:@"constitution"];
        _intelligence = [aDecoder decodeObjectForKey:@"intelligence"];
        _wisdom = [aDecoder decodeObjectForKey:@"wisdom"];
        _charisma = [aDecoder decodeObjectForKey:@"charisma"];
        _fortitude = [aDecoder decodeObjectForKey:@"fortitude"];
        _reflex = [aDecoder decodeObjectForKey:@"reflex"];
        _will = [aDecoder decodeObjectForKey:@"will"];
        _initiative = [aDecoder decodeObjectForKey:@"initiative"];
        _armorClass = [aDecoder decodeObjectForKey:@"armorClass"];
        _CMB = [aDecoder decodeObjectForKey:@"CMB"];
        _CMD = [aDecoder decodeObjectForKey:@"CMD"];
        
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.characterName forKey:@"characterName"];
    [aCoder encodeObject:self.aligment  forKey:@"alignment"];
    [aCoder encodeObject:self.player forKey:@"player"];
    [aCoder encodeObject:self.characterClass forKey:@"characterClass"];
    [aCoder encodeObject:self.diety forKey:@"diety"];
    [aCoder encodeObject:self.homeland forKey:@"homeland"];
    [aCoder encodeObject:self.race forKey:@"race"];
    [aCoder encodeObject:self.size forKey:@"size"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.hair forKey:@"hair"];
    [aCoder encodeObject:self.eyes forKey:@"eyes"];
    
    [aCoder encodeObject:self.languages forKey:@"languages"];
    [aCoder encodeObject:self.inventory forKey:@"inventory"];
    
    [aCoder encodeObject:self.characterLevel forKey:@"characterLevel"];
    [aCoder encodeObject:self.age forKey:@"age"];
    [aCoder encodeObject:self.height forKey:@"height"];
    [aCoder encodeObject:self.weight forKey:@"weight"];
    [aCoder encodeObject:self.hp forKey:@"hp"];
    [aCoder encodeObject:self.speed forKey:@"speed"];
    [aCoder encodeObject:self.baseAttackBonus forKey:@"baseAttackBonus"];
    [aCoder encodeObject:self.spellResistance forKey:@"spellResistance"];
    
    [aCoder encodeObject:self.strength forKey:@"strength"];
    [aCoder encodeObject:self.dexterity forKey:@"dexterity"];
    [aCoder encodeObject:self.constitution forKey:@"constitution"];
    [aCoder encodeObject:self.intelligence forKey:@"intelligence"];
    [aCoder encodeObject:self.wisdom forKey:@"wisdom"];
    [aCoder encodeObject:self.charisma forKey:@"charisma"];
    [aCoder encodeObject:self.fortitude forKey:@"fortitude"];
    [aCoder encodeObject:self.reflex forKey:@"reflex"];
    [aCoder encodeObject:self.will forKey:@"will"];
    [aCoder encodeObject:self.initiative forKey:@"initiative"];
    [aCoder encodeObject:self.armorClass forKey:@"armorClass"];
    [aCoder encodeObject:self.CMB forKey:@"CMB"];
    [aCoder encodeObject:self.CMD forKey:@"CMD"];
}



@end