//
//  NueueCoffeeViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCoffeeViewController : UIViewController

// NavigationBar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addCoffeeNavigationBarSaveButton;

// ScrollView
@property (weak, nonatomic) IBOutlet UIView *addCoffeeMainView;


// MainView
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeNameOrOriginTextField;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeRoasterTextField;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeLocationTextField;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeCuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeRoastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *addCoffeeBrewingMethodTextField;
@property (weak, nonatomic) IBOutlet UIView *addCoffeeRatingView;
@property (weak, nonatomic) IBOutlet UIImageView *addCoffeePhotoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *addCoffeeTastingWheelImageView;
@property (weak, nonatomic) IBOutlet UITextView *addCoffeeNotesTextView;
@property (weak, nonatomic) IBOutlet UIButton *addCoffeeMainViewSaveButton;


@end
