//
//  ViewController.h
//  FATES-iOS
//
//  Created by Stuart Dear on 2/26/15.
//  Copyright (c) 2015 Underdog Applications. All rights reserved.
//
//Frameworkds
#import <UIKit/UIKit.h>


//Cocoapods
#import <Colours.h>

//Navigation
#import "UDANavigation.h"

//Utilities
#import "UDAUtilities.h"

@interface UDAViewController : UIViewController

@property (nonatomic,strong) NSString *screenName;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end

