//
//  MEEKActivityIndicators.m
//  MEEKActivityIndicators
//
//  Created by Mike Keller on 1/30/12.
//  Copyright (c) 2012 Meek Apps. All rights reserved.
//

#import "MEEKActivityIndicators.h"
#import "AppDelegate.h" //Make Sure this is the name of your App Delegate
#import "MEEKLoadingView.h"
#import <QuartzCore/QuartzCore.h>

#define kLoadingViewTag 7040

@implementation MEEKActivityIndicators

#pragma mark - UITableView

// Sets the the tableView cell at indexPath's accessory to a UIActivityIndicatorView and starts animating
+ (void) showActivityIndicatorInTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath {
    UITableViewCell *thisCell = [tableView cellForRowAtIndexPath:indexPath];
	UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[activityIndicator startAnimating];
	[thisCell setAccessoryView:activityIndicator];
}

//Resets the selected tableView cell's accessory view to accessoryType (can be nil)
+ (void) resetTableView:(UITableView*)tableView withAccessory:(UITableViewCellAccessoryType)accessoryType {
    NSIndexPath *selectedRow = [tableView indexPathForSelectedRow];
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:selectedRow];
    
    [selectedCell setAccessoryView:nil];
    [selectedCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

#pragma mark - Overlay Loading View

//Shows the overlay version of the activity indicator (Loading...)
+ (void) showActivityOverlayViewAnimated:(BOOL)animated {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    MEEKLoadingView *loading = [[MEEKLoadingView alloc] initWithFrame:delegate.window.frame];
    loading.tag = kLoadingViewTag;
    
    if (animated) {
        loading.transform = CGAffineTransformMakeScale(0.1, 1); //start small horizontally and scale out
        [[delegate window] addSubview:loading];
        
        //Scale Up Effect
        [UIView animateWithDuration:0.15f 
                              delay:0.0f 
                            options:UIViewAnimationCurveEaseOut
                         animations:^(void){loading.transform = CGAffineTransformMakeScale(1.2, 1);}
                         completion:^(BOOL finished){
                             
                             //Bounce
                             [UIView animateWithDuration:0.15f 
                                                   delay:0.0f 
                                                 options:UIViewAnimationCurveEaseIn
                                              animations:^(void){loading.transform = CGAffineTransformMakeScale(0.95, 1);}
                                              completion:^(BOOL finished){
                                                  [UIView animateWithDuration:0.05f 
                                                                        delay:0.0f 
                                                                      options:UIViewAnimationCurveEaseOut 
                                                                   animations:^(void){loading.transform = CGAffineTransformMakeScale(1, 1);}
                                                                   completion:^(BOOL finished){}
                                                   ];
                                              }
                              ];
                         }
         ];
    }
}


//Hide the overlay version of the activity indicator (Loading...)
//A Simple Fade-out animation works best
+ (void) hideActivityOverlayViewAnimated:(BOOL)animation {
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    MEEKLoadingView *loading = (MEEKLoadingView*)[[delegate window] viewWithTag:kLoadingViewTag];
    
    [UIView animateWithDuration:0.5f 
                          delay:0.0f 
                        options:UIViewAnimationCurveEaseInOut 
                     animations:^(void){loading.alpha = 0.0f;}
                     completion:^(BOOL finished){[loading removeFromSuperview];}];
}

@end
