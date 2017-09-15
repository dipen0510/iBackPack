//
//  SkillsCreateGuideViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 13/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTHorizontalSelectionList.h"
#import "STCollapseTableView.h"
#import "MGSwipeTableCell.h"

@interface SkillsCreateGuideViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate, UITableViewDataSource, UITableViewDelegate, MGSwipeTableCellDelegate>  {
    NSMutableArray *footerItems;
    NSMutableArray *foldersArr;
}

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet STCollapseTableView *guideTableView;

- (IBAction)homeButtonTapped:(id)sender;

@end
