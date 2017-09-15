//
//  SkillsHomeDuelResultTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 16/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsHomeDuelResultTableViewCell.h"

@implementation SkillsHomeDuelResultTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _libraryImgView.layer.masksToBounds = YES;
    _libraryImgView.layer.cornerRadius = _libraryImgView.frame.size.height/2.;
    
    _addButton.layer.masksToBounds = YES;
    _addButton.layer.cornerRadius = _addButton.frame.size.height/2.;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
