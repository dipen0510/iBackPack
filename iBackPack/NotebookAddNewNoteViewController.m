//
//  NotebookAddNewNoteViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "NotebookAddNewNoteViewController.h"

@interface NotebookAddNewNoteViewController ()

@end

@implementation NotebookAddNewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
