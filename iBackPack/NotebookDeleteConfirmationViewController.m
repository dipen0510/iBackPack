//
//  NotebookDeleteConfirmationViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "NotebookDeleteConfirmationViewController.h"

@interface NotebookDeleteConfirmationViewController ()

@end

@implementation NotebookDeleteConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    
}

- (void) setupInitialUI {
    
    _containerView.layer.masksToBounds = YES;
    _containerView.layer.cornerRadius = 10.0;
    
    _deleteButton.layer.masksToBounds = YES;
    _deleteButton.layer.cornerRadius = _deleteButton.frame.size.height/2.;
    
    _cancelButton.layer.masksToBounds = YES;
    _cancelButton.layer.cornerRadius = _cancelButton.frame.size.height/2.;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
