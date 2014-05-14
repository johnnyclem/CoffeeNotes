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
@property (weak, nonatomic) NSDate *cuppingDateHolder;
@property (weak, nonatomic) NSDate *roastDateHolder;

@end
