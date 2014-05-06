//
//  CoffeeDetailViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "Coffee.h"
#import "Cupping.h"


@interface CoffeeDetailViewController : UIViewController 

// controllers
@property (nonatomic, weak) DataController *coffeeDetailDataController;

// models
@property (nonatomic, weak) Coffee *coffeeDetailCoffee;

@end
