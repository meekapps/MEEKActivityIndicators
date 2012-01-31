//
//  ButtonVC.m
//  MEEKProgressView
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//
//  An example implementation of MEEKLoadingView.
//  A single button that when pushed, shows the loading view, then after kButtonActivitySeconds
//    pushes a detail view and hides the loading view.

#import "ButtonVC.h"
#import "MEEKActivityIndicators.h"
#import "DetailVC.h"

//Number of seconds to show the activity indicator in this example.
#define kButtonActivitySeconds 3

@implementation ButtonVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - MEEKActivityIndicator Stuff

//Calls MEEKActivityIndicators class method showActivityOverlayViewAnimated:(BOOL)animated;
//  which shows a loading screen in the app delegate.
//Also be sure to call + (void) hideActivityOverlayViewAnimated:(BOOL)animated method when you push your 
//  detail view (whenever your a delegate method or completion block is done loading data.
- (void) startActivityViewAnimated {
    [MEEKActivityIndicators showActivityOverlayViewAnimated:YES]; //change to NO for no animation
}

//Push the detail view controller
- (void) pushDetailViewController {
    //hide the loading view
    [MEEKActivityIndicators hideActivityOverlayViewAnimated:YES];
    
    DetailVC *detailVC = [[DetailVC alloc] init];
    detailVC.title = @"Detail View";
    [self.navigationController pushViewController:detailVC animated:YES];
}

//Show the Detail View after kActivitySeconds seconds;
- (IBAction)showDetailButtonAction:(id)sender {
    //Create the Loading view overlay
	[self performSelectorInBackground:@selector(startActivityViewAnimated) withObject:nil];
    
    //Push the Detail View After kButtonActivitySeconds
    [self performSelector:@selector(pushDetailViewController) withObject:nil afterDelay:kButtonActivitySeconds];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
