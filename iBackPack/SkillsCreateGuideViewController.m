//
//  SkillsCreateGuideViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 13/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsCreateGuideViewController.h"
#import "SkillsCreateGuideTableViewCell.h"

@interface SkillsCreateGuideViewController ()

@end

@implementation SkillsCreateGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    [self setupFoldersDatasource];
    [self setupHorizontalListDatasource];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    _guideTableView.delegate = self;
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    _guideTableView.delegate = nil;
    
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
    _footerSelectionList.selectionIndicatorHorizontalPadding = (kScreenWidth/6.);
    
    _footerSelectionList.layer.masksToBounds = NO;
    _footerSelectionList.layer.shadowColor = [UIColor blackColor].CGColor;
    _footerSelectionList.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    _footerSelectionList.layer.shadowOpacity = 0.15f;
    _footerSelectionList.layer.shadowRadius = 7.0;
    
    
    footerItems = [[NSMutableArray alloc] initWithObjects:@"Create New",@"Already Created",nil];
    [self.view addSubview:_footerSelectionList];
    
}

- (void) setupFoldersDatasource {
    
    foldersArr = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* tmpdict1 = [[NSMutableDictionary alloc] init];
    [tmpdict1 setObject:@"Notes" forKey:@"title"];
    [tmpdict1 setObject:@"us_history_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict1];
    
    NSMutableDictionary* tmpdict2 = [[NSMutableDictionary alloc] init];
    [tmpdict2 setObject:@"Flash Cards" forKey:@"title"];
    [tmpdict2 setObject:@"geometry_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict2];
    
    _guideTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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

#pragma mark - HTHorizontalSelectionListDataSource Protocol Methods

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList {
    return footerItems.count;
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index {
    return footerItems[index];
}

#pragma mark - HTHorizontalSelectionListDelegate Protocol Methods

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index {
    // update the view for the corresponding index
    [_guideTableView reloadData];
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
    return [foldersArr count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MGSwipeTableCell";
    SkillsCreateGuideTableViewCell *cell = (SkillsCreateGuideTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // Load the top-level objects from the custom cell XIB.
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsCreateGuideTableViewCell" owner:self options:nil];
        // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.leftSwipeSettings.transition = data.transition;
    //    cell.rightSwipeSettings.transition = data.transition;
    //    cell.rightExpansion.buttonIndex = data.rightExpandableIndex;
    //    cell.rightExpansion.fillOnTrigger = NO;
//    cell.rightButtons = [self createRightButtons:4];
//    cell.delegate = self;
    
    if (indexPath.row == 0) {
        cell.headerLabel.text = @"English Learning";
        cell.separatorView.hidden = NO;
    }
    else if (indexPath.row == 1) {
        cell.headerLabel.text = @"Geography Class";
        cell.separatorView.hidden = NO;
    }
    else if (indexPath.row == 2) {
        cell.headerLabel.text = @"Chemistry Data";
        cell.separatorView.hidden = YES;
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 70.;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    header.backgroundColor = [UIColor whiteColor];
    
    UIImageView* expandImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 17.5, 15, 15)];
    expandImgView.image = [UIImage imageNamed:@"ic_circle_plus"];
    expandImgView.tag = 100+section;
    
    UIImageView* folderImgView = [[UIImageView alloc] initWithFrame:CGRectMake(52.5, 17.5, 19, 15)];
    folderImgView.image = [UIImage imageNamed:[[foldersArr objectAtIndex:section] valueForKey:@"image"]];
    
    UILabel* folderLabel = [[UILabel alloc] initWithFrame:CGRectMake(81.5, 20, 90, 14)];
    folderLabel.font = [UIFont fontWithName:@"GothamRounded-Medium" size:14.0];
    folderLabel.text = [[foldersArr objectAtIndex:section] valueForKey:@"title"];
    
    UIView* separatorView = [[UIView alloc] initWithFrame:CGRectMake(175., 26, header.frame.size.width-175., 1.)];
    separatorView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    [header addSubview:expandImgView];
    [header addSubview:folderImgView];
    [header addSubview:folderLabel];
    [header addSubview:separatorView];
    
    return header;
}


@end
