//
//  CoffeeDetailViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeDetailViewController : UIViewController

// Navigation Bar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *coffeeDetailEditButton;

// Main View
@property (weak, nonatomic) IBOutlet UIView *coffeeDetailMainView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeRoasterLabel;
@property (weak, nonatomic) IBOutlet UIView *coffeeRatingView;
@property (weak, nonatomic) IBOutlet UICollectionView *coffeePhotosCollectionView;
@property (weak, nonatomic) IBOutlet UIView *coffeeTastingWheelView;
@property (weak, nonatomic) IBOutlet UITableView *coffeeCuppingsTableView;
@property (weak, nonatomic) IBOutlet UIButton *coffeeAddNewCuppingButton;


@end
