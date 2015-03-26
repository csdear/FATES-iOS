//
//  UDAUtilities.m
//  FATES-iOS
//
//  Created by Stuart Dear on 3/9/15.
//  Copyright (c) 2015 Underdog Applications. All rights reserved.
//

#import "UDAUtilities.h"
#import "UDANavigation.h"


@implementation UDAUtilities

+ (void)trackScreenName:(NSString *)screenName {
    NSString *eventName = [NSString stringWithFormat:@"%@:PageView:%@", [self deviceIdiomString], screenName];
    NSLog(@"%@", eventName);
    
}

+ (NSString *)deviceIdiomString {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? @"iPhone" : @"iPad";
}

@end
