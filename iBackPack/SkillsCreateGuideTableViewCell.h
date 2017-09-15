//
//  SkillsCreateGuideTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsCreateGuideTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *libraryContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *libraryImgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIView *separatorView;

- (IBAction)checkboxTapped:(id)sender;

@end
