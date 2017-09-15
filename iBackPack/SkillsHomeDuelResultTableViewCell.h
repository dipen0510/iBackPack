//
//  SkillsHomeDuelResultTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 16/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsHomeDuelResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *libraryContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *libraryImgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UILabel *yourScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *hisScoreLabel;

@end
