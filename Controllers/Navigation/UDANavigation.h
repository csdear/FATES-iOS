//
//  UDANavigation.h
//  FATES-iOS
//
//  Created by Stuart Dear on 3/9/15.
//  Copyright (c) 2015 Underdog Applications. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - String Constants
extern NSString * const UDANavigateToViewController;
extern NSString * const UDANavigateToHome;  

@interface UDANavigation : NSObject

#pragma mark - Navigate HOME 
/**
 *  Navigates back to the home screen
 */  
+ (void)navigateHome;  

@end
