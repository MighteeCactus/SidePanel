//
//  SPCustomSlideViewController.m
//  SidePanel
//
//  Created by Alexander Bykov on 10/10/13.
//  Copyright (c) 2013 Alexander Bykov. All rights reserved.
//

#import "SPCustomSlideViewController.h"

@interface SPCustomSlideViewController ()

@end

@implementation SPCustomSlideViewController

- (void)configureSlider
{
    self.persentageSlideDistance = 0.5f;
    self.stickNavigationBarToParent = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.persentageSlideDistance = 0.5f;
//    self.stickNavigationBarToParent = YES;

    self.view.backgroundColor = [UIColor redColor];
}

@end
