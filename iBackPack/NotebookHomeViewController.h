//
//  NotebookHomeViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 19/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTHorizontalSelectionList.h"
#import "STCollapseTableView.h"

@interface NotebookHomeViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate,UITableViewDataSource, UITableViewDelegate>  {
    NSMutableArray *footerItems;
    NSMutableArray *foldersArr;
    UIActionSheet* folderActionSheet;
}

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *folderCollectionView;
@property (weak, nonatomic) IBOutlet STCollapseTableView *expandableFoldersTableView;

- (IBAction)homeButtonTapped:(id)sender;

@end
