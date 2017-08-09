//
//  LibraryHomeDetailTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 09/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "LibraryHomeDetailTableViewCell.h"

@implementation LibraryHomeDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _libraryImgView.layer.masksToBounds = YES;
    _libraryImgView.layer.cornerRadius = 5.;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
