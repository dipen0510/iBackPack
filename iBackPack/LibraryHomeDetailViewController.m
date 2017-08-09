//
//  LibraryHomeDetailViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 09/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "LibraryHomeDetailViewController.h"
#import "LibraryHomeDetailTableViewCell.h"

@interface LibraryHomeDetailViewController ()

@end

@implementation LibraryHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    
}

- (void) setupInitialUI {
    
    _profileImgView.layer.masksToBounds = YES;
    _profileImgView.layer.cornerRadius = _profileImgView.frame.size.height/2.;
    
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

#pragma - mark TableView Datasource and Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *CellIdentifier = @"LibraryHomeDetailTableViewCell";
    LibraryHomeDetailTableViewCell *cell = (LibraryHomeDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LibraryHomeDetailTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [self populateContentForLibraryCell:cell forIndexPath:indexPath];
    
    return cell;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 60.;
    
}

- (void) populateContentForLibraryCell:(LibraryHomeDetailTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.headerLabel.text = @"Albert Nichols";
            cell.ratingLabel.text = @"4.5";
            break;
        case 1:
            cell.headerLabel.text = @"Donna Rios";
            cell.ratingLabel.text = @"4.8";
            break;
        case 2:
            cell.headerLabel.text = @"Chemistry Data";
            cell.ratingLabel.text = @"4.3";
            break;
            
        default:
            break;
    }
    
}

@end
