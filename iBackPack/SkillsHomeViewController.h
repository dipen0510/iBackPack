//
//  SkillsHomeViewController.h
//  iBackPack
//
//  Created by Dipen Sekhsaria on 12/09/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTHorizontalSelectionList.h"

@interface SkillsHomeViewController : UIViewController <HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate> {
    
    NSMutableArray *footerItems;
    
}

@property (weak, nonatomic) IBOutlet UIView *studyGuideView;
@property (weak, nonatomic) IBOutlet UIView *assessmentView;
@property (weak, nonatomic) IBOutlet UIView *fillInBlanksView;
@property (weak, nonatomic) IBOutlet UIView *studyGuideSubVew;
@property (weak, nonatomic) IBOutlet UIView *assessmentSubview;
@property (weak, nonatomic) IBOutlet UIView *fillInBlanksSubview;

@property (strong, nonatomic) IBOutlet HTHorizontalSelectionList *footerSelectionList;

- (IBAction)homeButtonTapped:(id)sender;

@end
