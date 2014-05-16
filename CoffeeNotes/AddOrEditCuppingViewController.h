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
@property (strong, nonatomic) NSDate *cuppingCuppingDateHolder;
@property (strong, nonatomic) NSDate *cuppingRoastDateHolder;

// public outlets
@property (weak, nonatomic) IBOutlet UIButton *deleteCuppingButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseCuppingDateFromCuppingButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseRoastDateFromCuppingButton;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *mainViewSaveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarSaveButton;

@end
