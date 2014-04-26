//
//  NueueCoffeeViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NueueCoffeeViewController : UIViewController

// NavigationBar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nueueCoffeeNavigationBarSaveButton;

// ScrollView
@property (weak, nonatomic) IBOutlet UIView *nueueCoffeeMainView;

// MainView
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeNameOrOriginTextField;
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeRoasterTextField;
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeLocationTextField;
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeCuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeRoastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *nueueCoffeeBrewingMethodTextField;
@property (weak, nonatomic) IBOutlet UIView *nueueCoffeeRatingView;
@property (weak, nonatomic) IBOutlet UIImageView *nueueCoffeePhotoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *nueueCoffeeTastingWheelImageView;
@property (weak, nonatomic) IBOutlet UITextView *nueueCoffeeNotesTextView;
@property (weak, nonatomic) IBOutlet UIButton *nueueCoffeeMainViewSaveButton;


@end
