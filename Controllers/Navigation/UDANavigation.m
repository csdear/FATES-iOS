//
//  UDANavigation.m
//  FATES-iOS
//
//  Created by Stuart Dear on 3/9/15.
//  Copyright (c) 2015 Underdog Applications. All rights reserved.
//

#import "UDANavigation.h"
#import "UDAViewController.h"

#pragma mark - String Constants
NSString * const UDANavigateToViewController = @"UDANavigateToViewController";
NSString * const UDANavigateToHome = @"UDANavigateToHome";

@implementation UDANavigation

#pragma mark - Main Navigation Method
-(void)attemptToNavigateToViewController: (UIViewController *)viewController{
    if (viewController)
        {
        [[NSNotificationCenter defaultCenter] postNotificationName:UDANavigateToViewController object:nil userInfo:@{UDANavigateToViewController:viewController}];
        }
    }
    
#pragma mark - Navigate Home
    +(void)navigateHome {
        [[NSNotificationCenter defaultCenter] postNotificationName:UDANavigateToHome object:nil userInfo:nil];
    }
    
@end
