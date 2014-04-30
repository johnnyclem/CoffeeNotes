//
//  ViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataController;

@interface CoffeesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DataController *dataController;

@end
