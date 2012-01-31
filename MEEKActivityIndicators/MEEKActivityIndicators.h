//
//  MEEKActivityIndicators.h
//  MEEKActivityIndicators
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//
//  Some Class Methods with some neat Activity Indicator tricks.
//  The UITableView methods show/hide a UIActivityIndicator in the accessory view of the selected
//     UITableViewCell. 
//  The Overlay Loading View show/hide a full screen Loading View (MEEKLoadingView) with an 
//    optional bounch effect.

#import <Foundation/Foundation.h>

@interface MEEKActivityIndicators : NSObject

#pragma mark - UITableView

// Sets the the tableView cell at indexPath's accessory to a UIActivityIndicatorView and starts animating
+ (void) showActivityIndicatorInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath;

//Resets the selected tableView cell's accessory view to accessoryType (can be nil)
+ (void) resetTableView:(UITableView*)tableView withAccessory:(UITableViewCellAccessoryType)accessoryType;


#pragma mark - Overlay Loading View

//Shows the overlay version of the activity indicator (Loading...)
+ (void) showActivityOverlayViewAnimated:(BOOL)animated;


//Hide the overlay version of the activity indicator (Loading...)
+ (void) hideActivityOverlayViewAnimated:(BOOL)animated;

@end
