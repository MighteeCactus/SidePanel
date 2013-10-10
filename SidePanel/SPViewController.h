//
//  SPViewController.h
//  SidePanel
//
//  Created by Alexander Bykov on 10/9/13.
//  Copyright (c) 2013 Alexander Bykov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPSlideViewController.h"

@interface SPViewController : UIViewController

@property (nonatomic, strong) SPSlideViewController * rightVC;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)slide:(id)sender;

@end
