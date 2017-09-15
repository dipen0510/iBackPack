//
//  SkillsAssessmentViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsAssessmentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *decButton;
@property (weak, nonatomic) IBOutlet UIButton *incButton;
@property (weak, nonatomic) IBOutlet UITextField *questionTxtField;

- (IBAction)homeButtonTapped:(id)sender;
- (IBAction)incButtonTapped:(id)sender;
- (IBAction)decButtonTapped:(id)sender;

@end
