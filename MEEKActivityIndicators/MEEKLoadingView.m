//
//  MEEKLoadingView.m
//  MEEKActivityIndicators
//
//  Created by Mike Keller on 10/28/11.
//  Copyright (c) 2011 Meek Apps. All rights reserved.
//

#import "MEEKLoadingView.h"
#import <QuartzCore/QuartzCore.h>

#define kLoadingText @"Loading..." //Change this to change the text

@implementation MEEKLoadingView


//Create the actual loading view
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //Center of iPhone/iPod Touch window, create the gray, rounded rect box
        CGRect boxFrame = CGRectMake(100.0, 180.0f, 120.0f, 120.0f);
        UIView *grayBoxView = [[UIView alloc] initWithFrame:boxFrame];
        [grayBoxView setBackgroundColor:[UIColor colorWithWhite:0.01f alpha:0.6f]];
        [[grayBoxView layer] setCornerRadius:10.0f];
        [self addSubview:grayBoxView];
        
        //Activity Indicator, start animating
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [activity setCenter:CGPointMake(boxFrame.size.width/2, boxFrame.size.height/2 - 10.0f)];
        [activity startAnimating];
        [grayBoxView addSubview:activity];
        
        
        //Loading Label
        UILabel *loadingLabel = [[UILabel alloc] init];
        [loadingLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [loadingLabel setBackgroundColor:[UIColor clearColor]];
        [loadingLabel setTextColor:[UIColor whiteColor]];
        [loadingLabel setText:kLoadingText];
        [loadingLabel sizeToFit];
        [loadingLabel setCenter:CGPointMake(boxFrame.size.width/2, boxFrame.size.height - 25.0f)];
        [grayBoxView addSubview:loadingLabel];
            
        //Shadow Effect
        [[grayBoxView layer] setShadowColor:[[UIColor blackColor]CGColor]];
        [[grayBoxView layer] setShadowOffset:CGSizeMake(0.0f, 5.0f)];
        [[grayBoxView layer] setShadowOpacity:0.5f];
        [[grayBoxView layer] setShadowRadius:5.0f];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
