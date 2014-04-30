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


@interface CoffeeDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) DataController *dataController;
@property (nonatomic, weak) Coffee *coffee;

@end
