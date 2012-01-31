//
//  TableVC.m
//  MEEKProgressView
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//
//  A simple UITableView with a single cell demonstrating MEEKActivityIndicator for a table view.
//  Tapping on a cell shows the table accessory loading view for kActivitySeconds seconds, 
//    then pushes DetailVC.
//  Generally, you would instead push the detail view in a delegate method or completion block.
//

#import "TableVC.h"
#import "MEEKActivityIndicators.h"
#import "DetailVC.h"

//Number of seconds to show the activity indicator in this example.
#define kTableActivitySeconds 3

@implementation TableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    //Return control to the user.
    self.tableView.userInteractionEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

//Once the view is no longer visible, change the accessory view back into a detail disclosure indicator
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [MEEKActivityIndicators resetTableView:self.tableView withAccessory:UITableViewCellAccessoryDisclosureIndicator];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat: @"Show Detail View %d", indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - MEEKActivityIndicator Stuff

//Calls class method +(void) showActivityIndicatorInTableViewatIndexPath, which creates the activity indicator
//    as an accessory view of the selected cell.
//Also be sure to call +(void)resetTableView withAccessory method in viewDidDisappear.
- (void) startActivityViewForIndexPath:(NSIndexPath*)indexPath {
    [MEEKActivityIndicators showActivityIndicatorInTableView:self.tableView atIndexPath:indexPath];
}

//Push the detail view controller
- (void) pushDetailViewController {
    DetailVC *detailVC = [[DetailVC alloc] init];
    detailVC.title = @"Detail View";
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Locks the table view so the user can't select another cell. This is probably only a good idea if you
    //  expect loading to take more than a second but have already verified they have a connection (Reachability).
    //  Be sure to set this to yes in viewWillAppear if you do.
    self.tableView.userInteractionEnabled = NO;
    
    //Change Activity Indicator View to Spinner
	[self performSelectorInBackground:@selector(startActivityViewForIndexPath:) withObject:indexPath];
    
    //Push the detail view after kActivitySeconds seconds
    [self performSelector:@selector(pushDetailViewController) withObject:nil afterDelay:kTableActivitySeconds];

}

@end
