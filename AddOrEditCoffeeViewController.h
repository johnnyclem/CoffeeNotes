//
//  NueueCoffeeViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@interface AddOrEditCoffeeViewController : UIViewController



// models
@property (weak, nonatomic) Coffee *editableCoffee;
@property (strong, nonatomic) NSDate *coffeeCuppingDateHolder;
@property (strong, nonatomic) NSDate *coffeeRoastDateHolder;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *chooseCuppingDateButtonFromCoffee;
@property (weak, nonatomic) IBOutlet UIButton *chooseRoastDateButtonFromCoffee;
@property (weak, nonatomic) IBOutlet UIButton *mainViewSaveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;

@property (weak, nonatomic) IBOutlet UITextField *nameOrOriginTextField;

@end
