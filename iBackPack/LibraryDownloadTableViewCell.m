//
//  LibraryDownloadTableViewCell.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 09/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "LibraryDownloadTableViewCell.h"

@implementation LibraryDownloadTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _libraryImgView.layer.masksToBounds = YES;
    _libraryImgView.layer.cornerRadius = _libraryImgView.frame.size.height/2.;
    
    _libraryContainerView.layer.cornerRadius = 10.0;
    _libraryContainerView.layer.masksToBounds = NO;
    _libraryContainerView.layer.shadowColor = [UIColor blackColor].CGColor;
    _libraryContainerView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    _libraryContainerView.layer.shadowOpacity = 0.15f;
    _libraryContainerView.layer.shadowRadius = 5.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
