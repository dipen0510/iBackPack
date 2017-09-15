//
//  SkillsAssessmentViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 15/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsAssessmentViewController.h"
#import "SkillsAssessmentTableViewCell.h"

@interface SkillsAssessmentViewController ()

@end

@implementation SkillsAssessmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    
}

- (void) setupInitialUI {
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    _searchTextField.leftView = paddingView;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    
    _questionTxtField.layer.masksToBounds = YES;
    _questionTxtField.layer.cornerRadius = _questionTxtField.frame.size.height/2.;
    
    [self drawShadowForView:_searchTextField];
    
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

- (IBAction)homeButtonTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)incButtonTapped:(id)sender {
    
    int num = [_questionTxtField.text intValue];
    _questionTxtField.text = [NSString stringWithFormat:@"%d",(++num)];
    
}

- (IBAction)decButtonTapped:(id)sender {
    
    int num = [_questionTxtField.text intValue];
    _questionTxtField.text = [NSString stringWithFormat:@"%d",(--num)];
    
}

-(void)drawShadowForView:(UIView *)cardView{
    cardView.layer.cornerRadius = 8.0;
    cardView.layer.masksToBounds = NO;
    cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    cardView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    cardView.layer.shadowOpacity = 0.15f;
    cardView.layer.shadowRadius = 10.0;
    //    [cardView.layer setShouldRasterize:YES];
    
}


#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SkillsAssessmentTableViewCell";
    SkillsAssessmentTableViewCell *cell = (SkillsAssessmentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsAssessmentTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        cell.headerLabel.text = @"English Learning";
        cell.ratingLabel.text = @"4.5";
        cell.separatorView.hidden = NO;
    }
    else if (indexPath.row == 1) {
        cell.headerLabel.text = @"Geography Class";
        cell.ratingLabel.text = @"4.8";
        cell.separatorView.hidden = NO;
    }
    else if (indexPath.row == 2) {
        cell.headerLabel.text = @"Chemistry Data";
        cell.ratingLabel.text = @"4.3";
        cell.separatorView.hidden = YES;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70.;
    
}

@end
