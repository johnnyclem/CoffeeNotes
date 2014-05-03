//
//  CuppingDetailViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataController;
@class Coffee;
@class Cupping;


@interface CuppingDetailViewController : UIViewController

@property (weak, nonatomic) DataController *dataController;

@property (weak, nonatomic) Coffee *currentCoffee;
@property (weak, nonatomic) Cupping *currentCupping;

@end
