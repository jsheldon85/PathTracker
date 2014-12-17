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

@property (nonatomic) NSNumber *characterLevel;
@property (nonatomic) NSNumber *age;
@property (nonatomic) NSNumber *height;
@property (nonatomic) NSNumber *weight;
@property (nonatomic) NSNumber *hp;
@property (nonatomic) NSNumber *speed;
@property (nonatomic) NSNumber *baseAttackBonus;
@property (nonatomic) NSNumber *spellResistance;

//---Stats made up from two or more numbers---

//Abilities

@property (nonatomic) NSMutableDictionary *strength;
@property (nonatomic) NSMutableDictionary *dexterity;
@property (nonatomic) NSMutableDictionary *constitution;
@property (nonatomic) NSMutableDictionary *intelligence;
@property (nonatomic) NSMutableDictionary *wisdom;
@property (nonatomic) NSMutableDictionary *charisma;

//Saving Throws

@property (nonatomic) NSMutableDictionary *fortitude;
@property (nonatomic) NSMutableDictionary *reflex;
@property (nonatomic) NSMutableDictionary *will;

//Combat Stats

@property (nonatomic) NSMutableDictionary *initiative;
@property (nonatomic) NSMutableDictionary *armorClass;
@property (nonatomic) NSMutableDictionary *CMB;
@property (nonatomic) NSMutableDictionary *CMD;

@end
