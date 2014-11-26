//
//  PTRCharacter.h
//  PathTracker
//
//  Created by Student on 11/24/14.
//
//

#import <Foundation/Foundation.h>

@interface PTRCharacter : NSObject <NSCoding>

//Regular Stats

@property (nonatomic) NSString *characterName;
@property (nonatomic) NSString *aligment;
@property (nonatomic) NSString *player;
@property (nonatomic) NSString *characterClass;
@property (nonatomic) NSString *diety;
@property (nonatomic) NSString *homeland;
@property (nonatomic) NSString *race;
@property (nonatomic) NSString *size;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *hair;
@property (nonatomic) NSString *eyes;

@property (nonatomic) NSMutableArray *languages;
@property (nonatomic) NSMutableArray *inventory;

@property (nonatomic) int characterLevel;
@property (nonatomic) int age;
@property (nonatomic) int height;
@property (nonatomic) int weight;
@property (nonatomic) int hp;
@property (nonatomic) int speed;
@property (nonatomic) int baseAttackBonus;
@property (nonatomic) int spellResistance;

//---Stats made up from two or more numbers---

//Abilities

@property (nonatomic) NSDictionary *strength;
@property (nonatomic) NSDictionary *dexterity;
@property (nonatomic) NSDictionary *constitution;
@property (nonatomic) NSDictionary *intelligence;
@property (nonatomic) NSDictionary *wisdom;
@property (nonatomic) NSDictionary *charisma;

//Saving Throws

@property (nonatomic) NSDictionary *fortitude;
@property (nonatomic) NSDictionary *reflex;
@property (nonatomic) NSDictionary *will;

//Combat Stats

@property (nonatomic) NSDictionary *initiative;
@property (nonatomic) NSDictionary *armorClass;
@property (nonatomic) NSDictionary *CMB;
@property (nonatomic) NSDictionary *CMD;

@end
