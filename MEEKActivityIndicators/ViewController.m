//
//  ViewController.m
//  MEEKActivityIndicators
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//

#import "ViewController.h"
#import "TableVC.h"
#import "ButtonVC.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Init each tab's view controller
    
    //Table View
    TableVC *tableVC = [[TableVC alloc] initWithStyle:UITableViewStylePlain];
    tableVC.title = @"Table View";
    tableVC.tabBarItem.image = [UIImage imageNamed:@"tableviewtab.png"];
    UINavigationController *tableNavController = [[UINavigationController alloc] initWithRootViewController:tableVC];
    
    //Button View
    ButtonVC *buttonVC = [[ButtonVC alloc] initWithNibName:@"ButtonVC" bundle:nil];
    buttonVC.title = @"Button View";
    buttonVC.tabBarItem.image = [UIImage imageNamed:@"buttonviewtab.png"];
    UINavigationController *buttonNavController = [[UINavigationController alloc] initWithRootViewController:buttonVC];
    
    //Set the Tab Bar's View Controllers
    NSArray *viewControllers = [NSArray arrayWithObjects:tableNavController, buttonNavController, nil];
    self.viewControllers = viewControllers;
    self.selectedIndex = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
