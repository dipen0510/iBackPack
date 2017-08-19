//
//  NotebookHomeViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "NotebookHomeViewController.h"
#import "NotebookFoldersCollectionViewCell.h"

@interface NotebookHomeViewController ()

@end

@implementation NotebookHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupInitialUI];
    [self setupFoldersDatasource];
    [self setupActionSheet];
    
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
    _footerSelectionList.selectionIndicatorHorizontalPadding = (kScreenWidth/4.5);
    
    _footerSelectionList.layer.masksToBounds = NO;
    _footerSelectionList.layer.shadowColor = [UIColor blackColor].CGColor;
    _footerSelectionList.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    _footerSelectionList.layer.shadowOpacity = 0.15f;
    _footerSelectionList.layer.shadowRadius = 7.0;
    
    
    footerItems = [[NSMutableArray alloc] initWithObjects:@"Folders",@"All",nil];
    [self.view addSubview:_footerSelectionList];
    
}

- (void) setupFoldersDatasource {
    
    foldersArr = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* tmpdict1 = [[NSMutableDictionary alloc] init];
    [tmpdict1 setObject:@"Create New" forKey:@"title"];
    [tmpdict1 setObject:@"create_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict1];
    
    NSMutableDictionary* tmpdict2 = [[NSMutableDictionary alloc] init];
    [tmpdict2 setObject:@"US History" forKey:@"title"];
    [tmpdict2 setObject:@"us_history_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict2];
    
    NSMutableDictionary* tmpdict3 = [[NSMutableDictionary alloc] init];
    [tmpdict3 setObject:@"Geometry" forKey:@"title"];
    [tmpdict3 setObject:@"geometry_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict3];
    
    NSMutableDictionary* tmpdict4 = [[NSMutableDictionary alloc] init];
    [tmpdict4 setObject:@"Chemistry" forKey:@"title"];
    [tmpdict4 setObject:@"chemistry_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict4];
    
    NSMutableDictionary* tmpdict5 = [[NSMutableDictionary alloc] init];
    [tmpdict5 setObject:@"English" forKey:@"title"];
    [tmpdict5 setObject:@"english_folder" forKey:@"image"];
    [foldersArr addObject:tmpdict5];
    
    
}

- (void) setupActionSheet {
    
    folderActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:@"Edit", @"Apply Tag", nil];
    
}

#pragma mark - UICollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:      (NSInteger)section
{
    return [foldersArr count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NotebookFoldersCollectionViewCell *cell = (NotebookFoldersCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NotebookFoldersCollectionViewCell" forIndexPath:indexPath];
    
    cell.folderTitle.text = [[foldersArr objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.folderImgView.image = [UIImage imageNamed:[[foldersArr objectAtIndex:indexPath.row] valueForKey:@"image"]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    [folderActionSheet showInView:self.view];
    
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
    
    if (index == 0) {
        _folderCollectionView.hidden = NO;
        _expandableFoldersTableView.hidden = YES;
    }
    else {
        _folderCollectionView.hidden = YES;
        _expandableFoldersTableView.hidden = NO;
    }
    
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

#pragma mark - UIActionSheet Delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    [folderActionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES];
    
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [foldersArr count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"Dummy Text";
    
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView* header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    header.backgroundColor = [UIColor whiteColor];
    
    UIImageView* expandImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 17.5, 15, 15)];
    expandImgView.image = [UIImage imageNamed:@"ic_circle_plus"];
    
    UIImageView* folderImgView = [[UIImageView alloc] initWithFrame:CGRectMake(57.5, 17.5, 19, 15)];
    folderImgView.image = [UIImage imageNamed:[[foldersArr objectAtIndex:section] valueForKey:@"image"]];
    
    [header addSubview:expandImgView];
    [header addSubview:folderImgView];
    
    return header;
}

@end
