//
//  SkillsHomeViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 12/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTHorizontalSelectionList.h"
#import "GoSegmentedControl.h"
#import "STCollapseTableView.h"

@interface SkillsHomeViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate, GoSegmentedControlDataSource, GoSegmentedControlDelegate, UITableViewDataSource, UITableViewDelegate> {
    
    NSMutableArray *footerItems;
    NSMutableArray *headerItems;
    NSMutableArray *graphItems;
    NSMutableArray *foldersArr;
    
    BOOL isSkillsDuelSubView;
    
}

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *studyGuideView;
@property (weak, nonatomic) IBOutlet UIView *assessmentView;
@property (weak, nonatomic) IBOutlet UIView *fillInBlanksView;
@property (weak, nonatomic) IBOutlet UIView *studyGuideSubVew;
@property (weak, nonatomic) IBOutlet UIView *assessmentSubview;
@property (weak, nonatomic) IBOutlet UIView *fillInBlanksSubview;
@property (weak, nonatomic) IBOutlet UITableView *skillsTableView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet STCollapseTableView *skillsCollapseTableView;
@property (weak, nonatomic) IBOutlet UIImageView *chartsImgView;

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;
@property (strong, nonatomic) IBOutlet GoSegmentedControl *headerSelectionList;
@property (strong, nonatomic) IBOutlet GoSegmentedControl *graphSelectionList;

- (IBAction)homeButtonTapped:(id)sender;

@end
