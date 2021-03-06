//
//  LibraryHomeViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 02/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "LibraryHomeViewController.h"
#import "LibraryHomeTableViewCell.h"
#import "LibrarySearchTableViewCell.h"
#import "LibraryChatTableViewCell.h"
#import "LibraryDownloadTableViewCell.h"

@interface LibraryHomeViewController ()

@end

@implementation LibraryHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self setupHorizontalListDatasource];
    
}

- (void) setupInitialUI {

    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    _searchTextField.leftView = paddingView;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self drawShadowForView:_searchTextField];
    
}

- (void) setupHorizontalListDatasource {
    
    self.footerSelectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, kScreenHeight - 40, self.view.frame.size.width, 40)];
    _footerSelectionList.delegate = self;
    _footerSelectionList.dataSource = self;
    
    _footerSelectionList.centerButtons = YES;
    _footerSelectionList.selectionIndicatorColor = [UIColor colorWithRed:3./255. green:134./255. blue:190./255. alpha:1.0];
    [_footerSelectionList setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    _footerSelectionList.selectionIndicatorHorizontalPadding = (kScreenWidth/9.);
    
    _footerSelectionList.layer.masksToBounds = NO;
    _footerSelectionList.layer.shadowColor = [UIColor blackColor].CGColor;
    _footerSelectionList.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    _footerSelectionList.layer.shadowOpacity = 0.15f;
    _footerSelectionList.layer.shadowRadius = 7.0;
    
    
    footerItems = [[NSMutableArray alloc] initWithObjects:@"list",@"searchbar",@"blackbubble",@"download",nil];
    [self.view addSubview:_footerSelectionList];
    
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
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma - mark TableView Datasource and Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_footerSelectionList.selectedButtonIndex == 0) {
        static NSString *CellIdentifier = @"LibraryHomeTableViewCell";
        LibraryHomeTableViewCell *cell = (LibraryHomeTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LibraryHomeTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        [self populateContentForLibraryCell:cell forIndexPath:indexPath];
        
        return cell;
    }
    
    if (_footerSelectionList.selectedButtonIndex == 1) {
        
        static NSString *CellIdentifier = @"LibrarySearchTableViewCell";
        LibrarySearchTableViewCell *cell = (LibrarySearchTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LibrarySearchTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        [self populateContentForLibrarySearchCell:cell forIndexPath:indexPath];
        
        return cell;
        
    }
    
    if (_footerSelectionList.selectedButtonIndex == 2) {
        
        static NSString *CellIdentifier = @"LibraryChatTableViewCell";
        LibraryChatTableViewCell *cell = (LibraryChatTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LibraryChatTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        [self populateContentForLibraryChatCell:cell forIndexPath:indexPath];
        
        return cell;
        
    }
    
    static NSString *CellIdentifier = @"LibraryDownloadTableViewCell";
    LibraryDownloadTableViewCell *cell = (LibraryDownloadTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LibraryDownloadTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [self populateContentForLibraryDownloadCell:cell forIndexPath:indexPath];
    
    return cell;
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_footerSelectionList.selectedButtonIndex == 0) {
        [self performSegueWithIdentifier:@"showLibraryHomeDetailSegue" sender:nil];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_footerSelectionList.selectedButtonIndex == 0 || _footerSelectionList.selectedButtonIndex == 3) {
        return 105;
    }
    
    return 70.;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
    
}

- (void) populateContentForLibraryCell:(LibraryHomeTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
   switch (indexPath.row) {
            case 0:
                cell.headerLabel.text = @"English Learning";
                cell.ratingLabel.text = @"4.5";
                break;
            case 1:
                cell.headerLabel.text = @"Geography Class";
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

- (void) populateContentForLibrarySearchCell:(LibrarySearchTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.headerLabel.text = @"John Mathew";
            break;
        case 1:
            cell.headerLabel.text = @"John Doe";
            break;
        case 2:
            cell.headerLabel.text = @"John Corner";
            break;
            
        default:
            break;
    }
    
}

- (void) populateContentForLibraryChatCell:(LibraryChatTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.headerLabel.text = @"Albert Nichols";
            break;
        case 1:
            cell.headerLabel.text = @"Donna Rios";
            break;
        case 2:
            cell.headerLabel.text = @"Albert Webb";
            break;
            
        default:
            break;
    }
    
}

- (void) populateContentForLibraryDownloadCell:(LibraryDownloadTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.headerLabel.text = @"English Learning";
            cell.ratingLabel.text = @"4.5";
            break;
        case 1:
            cell.headerLabel.text = @"Geography Class";
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

#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return footerItems.count;
}

- (nullable UIView *)selectionList:(HTHorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index {
    
    UIView* contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25.0, 25.0)];
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 15., 15.0)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView.image = [UIImage imageNamed:[footerItems objectAtIndex:index]];
    
    [contentView addSubview:imageView];
    
    return contentView;
    
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    // update the view for the corresponding index
    [_libraryTableView reloadData];
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

@end
