//
//  ButtonVC.h
//  MEEKProgressView
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//
//  An example implementation of MEEKLoadingView.
//  A single button that when pushed, shows the loading view, then after kButtonActivitySeconds
//    pushes a detail view and hides the loading view.

#import <UIKit/UIKit.h>

@interface ButtonVC : UIViewController

//Handle the button tap for "Show Detail View" button
- (IBAction)showDetailButtonAction:(id)sender;

@end
