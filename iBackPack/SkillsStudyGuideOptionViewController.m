//
//  SkillsStudyGuideOptionViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 12/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsStudyGuideOptionViewController.h"

@interface SkillsStudyGuideOptionViewController ()

@end

@implementation SkillsStudyGuideOptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    
}

- (void) setupInitialUI {
    
    _containerView.layer.masksToBounds = YES;
    _containerView.layer.cornerRadius = 10.0;
    
    _manuallyButton.layer.masksToBounds = YES;
    _manuallyButton.layer.cornerRadius = _manuallyButton.frame.size.height/2.;
    
    _chooseFromExistingButton.layer.masksToBounds = YES;
    _chooseFromExistingButton.layer.cornerRadius = _chooseFromExistingButton.frame.size.height/2.;
    
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
