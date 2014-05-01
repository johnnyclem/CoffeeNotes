//
//  NewCuppingViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AddOrEditCuppingViewController.h"
#import "Cupping.h"

@interface AddOrEditCuppingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *cuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *roastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewingMethodTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

@end

@implementation AddOrEditCuppingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.coffeeNameOrOriginLabel.text = self.currentCoffee.nameOrOrigin;
    self.roasterLabel.text = self.currentCoffee.roaster;
    
    if (self.currentCupping) {
        
        self.locationTextField.text = self.currentCupping.location;
        self.cuppingDateTextField.text = self.currentCupping.cuppingDate;
        self.roastDateTextField.text = self.currentCupping.roastDate;
        self.brewingMethodTextField.text = self.currentCupping.brewingMethod;
        self.notesTextView.text = self.currentCupping.cuppingNotes;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveCupping:(id)sender {
    
//    if (self.locationTextField.text isEqualToString:@" ")
//    {
//        //alert view you need stuff
//        return;
//    }
    
    Cupping *newCupping;
    
    if (self.currentCupping)
    {
        newCupping = self.currentCupping;
    }
    else{
         newCupping = [Cupping new];
    }
    newCupping.location = self.locationTextField.text;
    newCupping.cuppingDate = self.cuppingDateTextField.text;
    newCupping.roastDate = self.roastDateTextField.text;
    newCupping.brewingMethod = self.brewingMethodTextField.text;
    newCupping.cuppingNotes = self.notesTextView.text;
    
    if (!self.currentCoffee.cuppings) {
        self.currentCoffee.cuppings = [NSMutableArray new];
    }
    
    if (!self.currentCupping) {
        [self.currentCoffee.cuppings addObject:newCupping];
    }
    
    [self.addOrEditCuppingDataController save];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
