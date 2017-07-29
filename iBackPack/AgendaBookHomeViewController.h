//
//  AgendaBookHomeViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 29/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTHorizontalSelectionList.h"
#import "iCarousel.h"

@interface AgendaBookHomeViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate> {
    NSMutableArray *caraouselItems;
    NSMutableArray *footerItems;
}

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;

- (IBAction)homeButtonTapped:(id)sender;
- (IBAction)addButtonTapped:(id)sender;

@end
