//
//  SkillsHomeViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 12/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsHomeViewController.h"
#import "SkillsStudyGuideOptionViewController.h"
#import "SkillsHomeDuelTableViewCell.h"
#import "SkillsHomeDuelSubTableViewCell.h"
#import "SkillsHomeTestResultTableViewCell.h"
#import "SkillsHomeDuelResultTableViewCell.h"

@interface SkillsHomeViewController () {
    
    SkillsStudyGuideOptionViewController* studyGuideOption;
    
}

@end

@implementation SkillsHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    [self setupFoldersDatasource];
    [self setupHorizontalListDatasource];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void) setupInitialUI {
    
    [self drawShadowForView:_studyGuideView];
    [self drawShadowForView:_assessmentView];
    [self drawShadowForView:_fillInBlanksView];
    
    [self drawCornerRadiusOnSubView:_studyGuideSubVew];
    [self drawCornerRadiusOnSubView:_assessmentSubview];
    [self drawCornerRadiusOnSubView:_fillInBlanksSubview];
    
    [_studyGuideView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showStudyGuideOptionDialog)]];
    _studyGuideView.userInteractionEnabled = YES;
    
    [_assessmentView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(assessmentViewTapped)]];
    _assessmentView.userInteractionEnabled = YES;
    
    _skillsTableView.hidden = YES;
    _skillsCollapseTableView.hidden = YES;
    
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
    
    
    footerItems = [[NSMutableArray alloc] initWithObjects:@"pencil",@"closed_book",@"task_complete",@"three_bars_graph",nil];
    [self.view addSubview:_footerSelectionList];
    
    
    //HEADER LIST
    
    self.headerSelectionList = [[GoSegmentedControl alloc] initWithFrame:CGRectMake(0, 87, self.view.frame.size.width, 40)];
    _headerSelectionList.delegate = self;
    _headerSelectionList.dataSource = self;
    _headerSelectionList.selectionIndicatorColor = [UIColor colorWithRed:93./255. green:188./255. blue:210./255. alpha:1.0];
    _headerSelectionList.backgroundColor = _headerView.backgroundColor;
    _headerSelectionList.indicatorAnimationDuration = 0.2;
    
    headerItems = [[NSMutableArray alloc] initWithObjects:@"Quiz",@"Fill in the blanks",nil];
    [self.view addSubview:_headerSelectionList];
    
    _headerSelectionList.hidden = YES;
    
}

- (void) setupFoldersDatasource {
    
    foldersArr = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* tmpdict1 = [[NSMutableDictionary alloc] init];
    [tmpdict1 setObject:@"Quiz" forKey:@"title"];
    [tmpdict1 setObject:@"us_history_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict1];
    
    NSMutableDictionary* tmpdict2 = [[NSMutableDictionary alloc] init];
    [tmpdict2 setObject:@"Fill in the blank" forKey:@"title"];
    [tmpdict2 setObject:@"geometry_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict2];
    
    _skillsCollapseTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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

- (void) assessmentViewTapped {
    
    [self performSegueWithIdentifier:@"showAssessmentSegue" sender:nil];
    
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

- (void) drawCornerRadiusOnSubView:(UIView *)subview {
    
    UIBezierPath *maskPath = [UIBezierPath
                              bezierPathWithRoundedRect:subview.bounds
                              byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
                              cornerRadii:CGSizeMake(8, 8)
                              ];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = subview.bounds;
    maskLayer.path = maskPath.CGPath;
    
    subview.layer.mask = maskLayer;
    
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
    
    switch (index) {
        case 0:
            isSkillsDuelSubView = NO;
            _assessmentView.hidden = NO;
            _studyGuideView.hidden = NO;
            _fillInBlanksView.hidden = NO;
            _skillsTableView.hidden = YES;
            _skillsCollapseTableView.hidden = YES;
            _headerSelectionList.hidden = YES;
            _headerLabel.text = @"Skills";
            break;
            
        case 1:
            isSkillsDuelSubView = NO;
            _assessmentView.hidden = YES;
            _studyGuideView.hidden = YES;
            _fillInBlanksView.hidden = YES;
            _skillsTableView.hidden = NO;
            _skillsCollapseTableView.hidden = YES;
            _headerSelectionList.hidden = NO;
            _headerLabel.text = @"Duel";
            [_skillsTableView reloadData];
            headerItems = [[NSMutableArray alloc] initWithObjects:@"Quiz",@"Fill in the blanks",nil];
            [_headerSelectionList reloadData];
            break;
            
        case 2:
            isSkillsDuelSubView = NO;
            _assessmentView.hidden = YES;
            _studyGuideView.hidden = YES;
            _fillInBlanksView.hidden = YES;
            _skillsTableView.hidden = YES;
            _skillsCollapseTableView.hidden = NO;
            _headerSelectionList.hidden = NO;
            _headerLabel.text = @"Result";
            [_skillsCollapseTableView reloadData];
            headerItems = [[NSMutableArray alloc] initWithObjects:@"Skill Test",@"Duel",nil];
            [_headerSelectionList reloadData];
            break;
            
        default:
            break;
    }
    
}

#pragma mark - GoSegment Datasource

- (NSInteger)numberOfSegmentsInGoSegmentedControl:(GoSegmentedControl *)segmentedControl{
    return headerItems.count;
}

- (UIView *)segmentedControl:(GoSegmentedControl *)segmentedControl customSegmentViewAtIndex:(NSInteger)index{
    UILabel *label = [UILabel new];
    [label setText:[headerItems objectAtIndex:index]];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"GothamRounded-Medium" size:13.0];
    label.textColor = [UIColor whiteColor];
    return label;
}

#pragma mark - GoSegment Delegate

- (CGFloat)segmentedControl:(GoSegmentedControl *)segmentedControl widthForSegmentAtIndex:(NSInteger)index{
    return [UIScreen mainScreen].bounds.size.width/headerItems.count;
}

- (void)segmentedControl:(GoSegmentedControl *)segmentedControl willMoveToIndex:(NSInteger)index {
    
    if (_footerSelectionList.selectedButtonIndex == 2) {
        
        if (index == 1) {
            isSkillsDuelSubView = NO;
            _assessmentView.hidden = YES;
            _studyGuideView.hidden = YES;
            _fillInBlanksView.hidden = YES;
            _skillsTableView.hidden = NO;
            _skillsCollapseTableView.hidden = YES;
            _headerSelectionList.hidden = NO;
            _headerLabel.text = @"Result";
            [_skillsTableView reloadData];
            headerItems = [[NSMutableArray alloc] initWithObjects:@"Skill Test",@"Duel",nil];
            [_headerSelectionList reloadData];
        }
        else {
            
            isSkillsDuelSubView = NO;
            _assessmentView.hidden = YES;
            _studyGuideView.hidden = YES;
            _fillInBlanksView.hidden = YES;
            _skillsTableView.hidden = YES;
            _skillsCollapseTableView.hidden = NO;
            _headerSelectionList.hidden = NO;
            _headerLabel.text = @"Result";
            [_skillsCollapseTableView reloadData];
            headerItems = [[NSMutableArray alloc] initWithObjects:@"Skill Test",@"Duel",nil];
            [_headerSelectionList reloadData];
            
        }
        
        
    }
    
}


#pragma mark - Study Guide Dialog Helpers

- (void) showStudyGuideOptionDialog {
    
    UIStoryboard *npsStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    studyGuideOption = (SkillsStudyGuideOptionViewController*)[npsStoryboard instantiateViewControllerWithIdentifier:@"SkillsStudyGuideOptionViewController"];
    studyGuideOption.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight) ;
    
    [studyGuideOption.manuallyButton addTarget:self action:@selector(optionDialogManuallyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [studyGuideOption.chooseFromExistingButton addTarget:self action:@selector(optionDialogExistingButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:studyGuideOption.view];
    
}

- (void) optionDialogManuallyButtonTapped:(id)sender {
    [studyGuideOption.view removeFromSuperview];
    [self performSegueWithIdentifier:@"showCreateGuideSegue" sender:nil];
}

- (void) optionDialogExistingButtonTapped:(id)sender {
    [studyGuideOption.view removeFromSuperview];
    [self performSegueWithIdentifier:@"showCreateGuideSegue" sender:nil];
}


#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView == _skillsCollapseTableView) {
        return [foldersArr count];
    }
    
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _skillsCollapseTableView) {
        
        static NSString *CellIdentifier = @"SkillsHomeTestResultTableViewCell";
        SkillsHomeTestResultTableViewCell *cell = (SkillsHomeTestResultTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsHomeTestResultTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self populateContentForSkillsResultCell:cell forIndexPath:indexPath];
        
        return cell;
        
    }
    else {
        
        if (_footerSelectionList.selectedButtonIndex == 2) {
            
            static NSString *CellIdentifier = @"SkillsHomeDuelResultTableViewCell";
            SkillsHomeDuelResultTableViewCell *cell = (SkillsHomeDuelResultTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) {
                // Load the top-level objects from the custom cell XIB.
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsHomeDuelResultTableViewCell" owner:self options:nil];
                // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                cell = [topLevelObjects objectAtIndex:0];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [self populateContentForSkillsDuelResultCell:cell forIndexPath:indexPath];
            
            return cell;
            
            
        }
        
        
        if (isSkillsDuelSubView) {
            
            static NSString *CellIdentifier = @"SkillsHomeDuelSubTableViewCell";
            SkillsHomeDuelSubTableViewCell *cell = (SkillsHomeDuelSubTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil) {
                // Load the top-level objects from the custom cell XIB.
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsHomeDuelSubTableViewCell" owner:self options:nil];
                // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
                cell = [topLevelObjects objectAtIndex:0];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            [self populateContentForDuelSubviewCell:cell forIndexPath:indexPath];
            
            return cell;
            
            
        }
        
        
        static NSString *CellIdentifier = @"SkillsHomeDuelTableViewCell";
        SkillsHomeDuelTableViewCell *cell = (SkillsHomeDuelTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            // Load the top-level objects from the custom cell XIB.
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SkillsHomeDuelTableViewCell" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self populateContentForDuelCell:cell forIndexPath:indexPath];
        
        return cell;

        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (isSkillsDuelSubView || tableView == _skillsCollapseTableView || _footerSelectionList.selectedButtonIndex == 2) {
        return 3;
    }
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (isSkillsDuelSubView) {
        return 75.;
    }
    
    if (tableView == _skillsCollapseTableView) {
        return 55.;
    }
    
    if (_footerSelectionList.selectedButtonIndex == 2) {
        return 75.;
    }
    
    return 60.;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (tableView == _skillsCollapseTableView) {
        return 50;
    }
    
    return 0;
}

- (void) populateContentForDuelCell:(SkillsHomeDuelTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        cell.headerLabel.text = @"Quiz 1";
        cell.subHeadingLabel.text = @"10 Questions";
    }
    else if (indexPath.row == 1) {
        cell.headerLabel.text = @"Quiz 2";
        cell.subHeadingLabel.text = @"15 Questions";
    }
    else if (indexPath.row == 2) {
        cell.headerLabel.text = @"Quiz 3";
        cell.subHeadingLabel.text = @"20 Questions";
    }
    else if (indexPath.row == 3) {
        cell.headerLabel.text = @"Quiz 4";
        cell.subHeadingLabel.text = @"25 Questions";
    }

    
}

- (void) populateContentForDuelSubviewCell:(SkillsHomeDuelSubTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
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

- (void) populateContentForSkillsResultCell:(SkillsHomeTestResultTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.testNameLabel.text = @"Test 1";
            cell.testNumberLabel.text = @"8/10";
            cell.testPercentLabel.text = @"80%";
            cell.seperatorView.hidden = NO;
            break;
        case 1:
            cell.testNameLabel.text = @"Test 2";
            cell.testNumberLabel.text = @"10/15";
            cell.testPercentLabel.text = @"66%";
            cell.seperatorView.hidden = NO;
            break;
        case 2:
            cell.testNameLabel.text = @"Test 3";
            cell.testNumberLabel.text = @"10/20";
            cell.testPercentLabel.text = @"50%";
            cell.seperatorView.hidden = YES;
            break;
            
        default:
            break;
    }
    
}

- (void) populateContentForSkillsDuelResultCell:(SkillsHomeDuelResultTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
            cell.headerLabel.text = @"John Mathew";
            cell.yourScoreLabel.text = @"Your Score : 8/10";
            cell.hisScoreLabel.text = @"His Score : 7/10";
            [cell.addButton setTitle:@"You Won" forState:UIControlStateNormal];
            cell.addButton.backgroundColor = [UIColor colorWithRed:127./255. green:193./255. blue:105./255. alpha:1.0];
            break;
        case 1:
            cell.headerLabel.text = @"John Doe";
            cell.yourScoreLabel.text = @"Your Score : 7/10";
            cell.hisScoreLabel.text = @"His Score : 8/10";
            [cell.addButton setTitle:@"You Lose" forState:UIControlStateNormal];
            cell.addButton.backgroundColor = [UIColor colorWithRed:231./255. green:93./255. blue:94./255. alpha:1.0];
            break;
        case 2:
            cell.headerLabel.text = @"John Corner";
            cell.yourScoreLabel.text = @"Your Score :";
            cell.hisScoreLabel.text = @"His Score :";
            [cell.addButton setTitle:@"Pending" forState:UIControlStateNormal];
            cell.addButton.backgroundColor = [UIColor colorWithRed:3./255. green:134./255. blue:190./255. alpha:1.0];
            break;
            
        default:
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    isSkillsDuelSubView = YES;
    [tableView reloadData];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (tableView == _skillsCollapseTableView) {
        UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        header.backgroundColor = [UIColor whiteColor];
        
        UIImageView* expandImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 17.5, 15, 15)];
        expandImgView.image = [UIImage imageNamed:@"ic_circle_plus"];
        expandImgView.tag = 100+section;
        
        UIImageView* folderImgView = [[UIImageView alloc] initWithFrame:CGRectMake(52.5, 17.5, 19, 15)];
        folderImgView.image = [UIImage imageNamed:[[foldersArr objectAtIndex:section] valueForKey:@"image"]];
        
        UILabel* folderLabel = [[UILabel alloc] initWithFrame:CGRectMake(81.5, 20, 110, 14)];
        folderLabel.font = [UIFont fontWithName:@"GothamRounded-Medium" size:14.0];
        folderLabel.text = [[foldersArr objectAtIndex:section] valueForKey:@"title"];
        
        UIView* separatorView = [[UIView alloc] initWithFrame:CGRectMake(220., 26, header.frame.size.width-220., 1.)];
        separatorView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        
        [header addSubview:expandImgView];
        [header addSubview:folderImgView];
        [header addSubview:folderLabel];
        [header addSubview:separatorView];
        
        return header;
    }
    
    return nil;
    
}

@end
