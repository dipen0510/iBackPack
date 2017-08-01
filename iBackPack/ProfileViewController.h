//
//  ProfileViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 02/08/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userProfileImgView;
@property (weak, nonatomic) IBOutlet UIButton *genderButton;
@property (weak, nonatomic) IBOutlet UILabel *engTmpLabel;
@property (weak, nonatomic) IBOutlet UILabel *chemTempLabel;


- (IBAction)homeButtonTapped:(id)sender;
- (IBAction)genderButtonTapped:(id)sender;
@end
