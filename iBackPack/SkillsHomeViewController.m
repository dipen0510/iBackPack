//
//  SkillsHomeViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 12/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "SkillsHomeViewController.h"
#import "SkillsStudyGuideOptionViewController.h"

@interface SkillsHomeViewController () {
    
    SkillsStudyGuideOptionViewController* studyGuideOption;
    
}

@end

@implementation SkillsHomeViewController

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

@end
