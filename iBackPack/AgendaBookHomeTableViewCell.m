//
//  AgendaBookHomeTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 30/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "AgendaBookHomeTableViewCell.h"

@implementation AgendaBookHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)radioButtonTapped:(id)sender {
    [_radioButton setTitleColor:[UIColor colorWithRed:3./255. green:134./255. blue:190./255. alpha:1.0] forState:UIControlStateNormal];
    _radioButton.iconColor = [UIColor colorWithRed:3./255. green:134./255. blue:190./255. alpha:1.0];
    _radioButton.iconStrokeWidth = 10.0;
}
@end
