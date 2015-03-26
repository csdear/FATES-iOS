//
//  ViewController.m
//  FATES-iOS
//
//  Created by Stuart Dear on 2/26/15.
//  Copyright (c) 2015 Underdog Applications. All rights reserved.
//

#import "UDAViewController.h"
#import "UDAHomeViewController.h"



@interface UDAViewController ()
- (void)addBackgroundImage;
@end

@implementation UDAViewController

#pragma mark - Init
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

//UI
    [self removeNavBar];
    [self addBackgroundImage];
    self.view.backgroundColor = [UIColor blueColor];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //Navigation
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter]addObserverForName:UDANavigateToViewController object:nil
        queue:nil usingBlock:^(NSNotification *note){
        //Break if self no longer exists
        if(!weakSelf){
            return;
        }
        
        //Navigate to new ViewController
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if ([[strongSelf.navigationController viewControllers] lastObject] == strongSelf) {
            if(note.userInfo && note.userInfo[UDANavigateToViewController]) {
                [strongSelf navigateToViewController:note.userInfo[UDANavigateToViewController]];
            }
        }
    }];
    
    // Pop to Home
    [[NSNotificationCenter defaultCenter] addObserverForName:UDANavigateToHome object:nil queue:nil usingBlock:^(NSNotification *note) {
        if (weakSelf && ![weakSelf isKindOfClass:[UDAHomeViewController class]]) {
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    
    // Logging
    if (self.screenName) {
        [UDAUtilities trackScreenName:self.screenName];
    }
    
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Remove NSNotificationCenter
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI 
-(void)removeNavBar {
    //Removing the header
    for (UIView *subview in self.navigationController.navigationBar.subviews) {
        if (subview.tag == 1337) {
            [subview removeFromSuperview];
        }
    }
}

- (void)addBackgroundImage{
    UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    UIImageView *backgroundImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.wid, <#CGFloat width#>, <#CGFloat height#>)]
    [backgroundImgView setImage:[UIImage imageNamed:@"app_background"]];
    [backgroundImgView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [backgroundImgView setContentMode:UIViewContentModeScaleToFill];
    [self.view insertSubview:backgroundImgView atIndex:0];
}

    
#pragma mark - Navigation Delegate
- (void)navigateToViewController:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:YES];
}

    
@end


