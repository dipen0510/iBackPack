//
//  SkillsCreateGuideTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsCreateGuideTableViewCell.h"

@implementation SkillsCreateGuideTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _libraryImgView.layer.masksToBounds = YES;
    _libraryImgView.layer.cornerRadius = _libraryImgView.frame.size.height/2.;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)checkboxTapped:(id)sender {
    
    _checkboxButton.selected = !_checkboxButton.isSelected;
    
}
@end
