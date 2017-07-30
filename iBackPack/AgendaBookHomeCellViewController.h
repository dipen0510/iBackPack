//
//  AgendaBookHomeCellViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 30/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgendaBookHomeCellViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *dueButton;
@property (weak, nonatomic) IBOutlet UIButton *upcomingButton;
@property (weak, nonatomic) IBOutlet UIView *bodyView;
@property (weak, nonatomic) IBOutlet UITableView *summaryTableView;

@end
