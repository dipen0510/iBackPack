//
//  AgendaBookAddNewViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 01/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iBackPack-Swift.h"
#import "HTHorizontalSelectionList.h"

@class SkyFloatingLabelTextField;

@interface AgendaBookAddNewViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate> {
    
    NSMutableArray *footerItems;
    
}

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;

@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextField *assignmentNameTextField;
@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextField *dateTextField;
@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextField *monthTextField;
@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextField *yearTextField;
@property (weak, nonatomic) IBOutlet SkyFloatingLabelTextField *subjectTextField;
@property (weak, nonatomic) IBOutlet UIButton *assignmentAddButton;

- (IBAction)homeButtonTapped:(id)sender;

@end
