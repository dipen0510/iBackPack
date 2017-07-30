//
//  AgendaBookHomeTableViewCell.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 30/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLRadioButton.h"

@interface AgendaBookHomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet DLRadioButton *radioButton;
@property (weak, nonatomic) IBOutlet UILabel *radioLabel;

- (IBAction)radioButtonTapped:(id)sender;

@end
