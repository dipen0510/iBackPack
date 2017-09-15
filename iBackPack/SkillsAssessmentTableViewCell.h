//
//  SkillsAssessmentTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsAssessmentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *libraryContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *libraryImgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIView *separatorView;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

- (IBAction)checkboxTapped:(id)sender;

@end
