//
//  NotebookPermissionsViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotebookPermissionsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *permissionsTableView;
@property (weak, nonatomic) IBOutlet UIView *lockContainerView;
@property (weak, nonatomic) IBOutlet UIButton *lockPermissionButton;

- (IBAction)backButtonTapped:(id)sender;
- (IBAction)lockPermissionButtonTapped:(id)sender;

@end
