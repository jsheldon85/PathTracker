//
//  PTRBioViewController.h
//  PathTracker
//
//  Created by Student on 12/16/14.
//
//

#import <UIKit/UIKit.h>

@class PTRCharacter;

@interface PTRBioViewController : UIViewController <UITextFieldDelegate>

-(instancetype)initWithCharacter:(PTRCharacter *)character;

@end
