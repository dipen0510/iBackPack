//
//  SkillsHomeTestResultTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillsHomeTestResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *testNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *testNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *testPercentLabel;
@property (weak, nonatomic) IBOutlet UIView *seperatorView;

@end
