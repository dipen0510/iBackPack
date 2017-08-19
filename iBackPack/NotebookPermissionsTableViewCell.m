//
//  NotebookPermissionsTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "NotebookPermissionsTableViewCell.h"

@implementation NotebookPermissionsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _libraryImgView.layer.masksToBounds = YES;
    _libraryImgView.layer.cornerRadius = _libraryImgView.frame.size.height/2.;
    
    [self.addButton addTarget:self action:@selector(addButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) addButtonTapped {
    
    _addButton.selected = !_addButton.isSelected;
    
}

@end
