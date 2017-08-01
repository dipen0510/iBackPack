//
//  LibraryHomeViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 02/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryHomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *libraryTableView;

- (IBAction)homeButtonTapped:(id)sender;
@end
