//
//  ViewController.m
//  iBackPack
//
//  Created by Dipen Sekhsaria on 29/07/17.
//  Copyright © 2017 Dipen Sekhsaria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupInitialUI];
    
}

- (void) setupInitialUI {
    
    [self drawShadowForView:_agendaBookView];
    [self drawShadowForView:_flashCardsView];
    [self drawShadowForView:_skillsView];
    [self drawShadowForView:_notebookView];
    [self drawShadowForView:_libraryView];
    [self drawShadowForView:_settingsView];
    
    [_agendaBookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(agendaBookTapped)]];
    _agendaBookView.userInteractionEnabled = YES;
    
    [_libraryView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(libraryTapped)]];
    _libraryView.userInteractionEnabled = YES;
    
    [_notebookView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(notebookTapped)]];
    _notebookView.userInteractionEnabled = YES;
    
}

- (void) agendaBookTapped {
    
    [self performSegueWithIdentifier:@"showAgendaBookSegue" sender:nil];
    
}

- (void) libraryTapped {
    
    [self performSegueWithIdentifier:@"showLibrarySegue" sender:nil];
    
}

- (void) notebookTapped {
    
    [self performSegueWithIdentifier:@"showNotebookSegue" sender:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
