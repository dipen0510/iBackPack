//
//  AgendaBookHomeViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 29/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "AgendaBookHomeViewController.h"
#import "AgendaBookHomeCellViewController.h"

@interface AgendaBookHomeViewController ()

@end

@implementation AgendaBookHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self setupCaraouselDatasource];
    [self setupHorizontalListDatasource];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    _carouselView.hidden = YES;
    _carouselView = nil;
    
}

- (void) setupCaraouselDatasource {
    
    caraouselItems = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        [caraouselItems addObject:@(i)];
    }
    
//    _carouselView.type = iCarouselTypeTimeMachine;
    [_carouselView reloadData];
    
}

- (void) setupHorizontalListDatasource {
    
    self.footerSelectionList = [[HTHorizontalSelectionList alloc] initWithFrame:CGRectMake(0, kScreenHeight - 40, self.view.frame.size.width, 40)];
    _footerSelectionList.delegate = self;
    _footerSelectionList.dataSource = self;
    
    _footerSelectionList.centerButtons = YES;
    _footerSelectionList.selectionIndicatorColor = [UIColor colorWithRed:3./255. green:134./255. blue:190./255. alpha:1.0];
    [_footerSelectionList setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    _footerSelectionList.selectionIndicatorHorizontalPadding = (kScreenWidth/7.);
    
    _footerSelectionList.layer.masksToBounds = NO;
    _footerSelectionList.layer.shadowColor = [UIColor blackColor].CGColor;
    _footerSelectionList.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    _footerSelectionList.layer.shadowOpacity = 0.15f;
    _footerSelectionList.layer.shadowRadius = 7.0;

    
    footerItems = [[NSMutableArray alloc] initWithObjects:@"Day",@"Week",@"Month",nil];
    [self.view addSubview:_footerSelectionList];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [caraouselItems count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    AgendaBookHomeCellViewController* agendaBookCellView = [[AgendaBookHomeCellViewController alloc] init];
    
    //create new view if no view is available for recycling
//    if (view == nil)
//    {
//        agendaBookCellView = [[AgendaBookHomeCellViewController alloc] init];
        agendaBookCellView.view.tag = 1;
        agendaBookCellView.summaryTableView.tag = 2;
        
        view = [[UIView alloc] initWithFrame:_carouselView.frame];
        view.contentMode = UIViewContentModeCenter;
        agendaBookCellView.view.center = CGPointMake(view.center.x, agendaBookCellView.view.center.y);
        [view addSubview:agendaBookCellView.view];
    
        
//    }
//    else
//    {
//        //get a reference to the label in the recycled view
//        agendaBookCellView.view = [view viewWithTag:1];
//        agendaBookCellView.summaryTableView = (UITableView *)[view viewWithTag:2];
//
//    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
//    label.text = [caraouselItems[index] stringValue];
    
    [agendaBookCellView.summaryTableView reloadData];
    
    return view;
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
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - User Action Events

- (IBAction)homeButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addButtonTapped:(id)sender {
}
@end
