//
//  NewCuppingViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Coffee.h"
#import "Cupping.h"


@interface AddOrEditCuppingViewController : UIViewController

// public models
@property Coffee *selectedCoffee;
@property Cupping *editableCupping;

// public outlets
@property (weak, nonatomic) IBOutlet UIButton *deleteCuppingButton;

@end
