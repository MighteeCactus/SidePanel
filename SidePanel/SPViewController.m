//
//  SPViewController.m
//  SidePanel
//
//  Created by Alexander Bykov on 10/9/13.
//  Copyright (c) 2013 Alexander Bykov. All rights reserved.
//

#import "SPViewController.h"
#import "SPSlideViewController.h"

#define SLIDE_DISTANCE 250.0

@interface SPViewController ()
@property (nonatomic) BOOL isOffseted;
@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addChildViewController:self.rightVC];
}

- (SPSlideViewController *)rightVC
{
    if (_rightVC == nil) {
        _rightVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rightPanel"];
    }

    return _rightVC;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.view insertSubview:self.navigationController.navigationBar atIndex:0];

}

- (IBAction)slide:(id)sender
{
    [self.rightVC toggleSlide];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    [self.navigationController.view insertSubview:self.navigationController.navigationBar atIndex:1];
}

@end
