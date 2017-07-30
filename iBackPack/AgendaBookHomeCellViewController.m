//
//  AgendaBookHomeCellViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 30/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "AgendaBookHomeCellViewController.h"
#import "AgendaBookHomeTableViewCell.h"

@interface AgendaBookHomeCellViewController ()

@end

@implementation AgendaBookHomeCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupInitialUI];
}

- (void) setupInitialUI {
    
    _dueButton.layer.masksToBounds = YES;
    _upcomingButton.layer.masksToBounds = YES;
    _dueButton.layer.cornerRadius = _dueButton.frame.size.height/2.;
    _upcomingButton.layer.cornerRadius = _upcomingButton.frame.size.height/2.;
    
    _headerView.layer.cornerRadius = 10.0;
    _headerView.layer.masksToBounds = NO;
    _headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    _headerView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    _headerView.layer.shadowOpacity = 0.15f;
    _headerView.layer.shadowRadius = 5.0;
    
    _bodyView.layer.cornerRadius = 10.0;
    _bodyView.layer.masksToBounds = NO;
    _bodyView.layer.shadowColor = [UIColor blackColor].CGColor;
    _bodyView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    _bodyView.layer.shadowOpacity = 0.15f;
    _bodyView.layer.shadowRadius = 5.0;
    
    [_summaryTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark TableView Datasource and Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 3;
    }
    
    return 2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *CellIdentifier = @"AgendaBookHomeTableViewCell";
    AgendaBookHomeTableViewCell *cell = (AgendaBookHomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AgendaBookHomeTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [self populateContentForTasksCell:cell forIndexPath:indexPath];
    
    return cell;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 50)];
        /* Create custom view to display section header... */
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 10, 100., 40.)];
        [label setFont:[UIFont fontWithName:@"GothamRounded-Medium" size:14.0]];
        label.textAlignment = NSTextAlignmentLeft;
        
        NSString *string = @"";
        
        if (section == 0) {
            string = @"Due";
            [label setTextColor:_dueButton.backgroundColor];
        }
        else if (section == 1) {
            string = @"Upcoming";
            [label setTextColor:_upcomingButton.backgroundColor];
        }
        
        
        /* Section header is in 0th index... */
        [label setText:string];
        [view addSubview:label];
        [view setBackgroundColor:[UIColor clearColor]]; //your background color...
        return view;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50.0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44.;
    
}

- (void) populateContentForTasksCell:(AgendaBookHomeTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        
        switch (indexPath.row) {
            case 0:
                [cell.radioButton setTitle: @"English Essay" forState:UIControlStateNormal];
                break;
            case 1:
                [cell.radioButton setTitle: @"DB Class" forState:UIControlStateNormal];
                break;
            case 2:
                [cell.radioButton setTitle: @"Math Workshop" forState:UIControlStateNormal];                break;
                
            default:
                break;
        }
        
        
    }
    
    else if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 0:
                [cell.radioButton setTitle: @"Novel Analysis" forState:UIControlStateNormal];
                break;
            case 1:
                [cell.radioButton setTitle: @"Science Project" forState:UIControlStateNormal];
                break;
                
            default:
                break;
        }
        
        
    }
    
    cell.radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
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
