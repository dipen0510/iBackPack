//
//  NotebookPermissionsTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotebookPermissionsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *libraryContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *libraryImgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end
