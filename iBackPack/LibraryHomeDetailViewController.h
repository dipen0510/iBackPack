//
//  LibraryHomeDetailViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 09/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryHomeDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profileImgView;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UITableView *reviewTableView;

- (IBAction)backButtonTapped:(id)sender;

@end
