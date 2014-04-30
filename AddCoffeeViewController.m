//
//  NueueCoffeeViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AddCoffeeViewController.h"
#import "Coffee.h"
#import "Cupping.h"
#import "DataController.h"
#import "CoffeesViewController.h"

@interface AddCoffeeViewController ()

@end

@implementation AddCoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)addCoffeeCancel {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addCoffeeSave {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // New Coffee Stuff
    Coffee *newCoffee = [Coffee new];
    newCoffee.nameOrOrigin = self.addCoffeeNameOrOriginTextField.text;
    newCoffee.roaster = self.addCoffeeRoasterTextField.text;
    newCoffee.cuppings = [NSMutableArray new];
    
    // New Cupping Stuff
    Cupping *newCupping = [Cupping new];
    newCupping.location = self.addCoffeeLocationTextField.text;
    newCupping.cuppingDate = self.addCoffeeCuppingDateTextField.text;
    newCupping.roastDate = self.addCoffeeRoastDateTextField.text;
    newCupping.brewingMethod = self.addCoffeeBrewingMethodTextField.text;
    newCupping.cuppingRating = self.addCoffeeRatingView;
    //    newCupping.image = self.addCoffeePhotoImageView;
    newCupping.cuppingNotes = self.addCoffeeNotesTextView.text;
    [newCoffee.cuppings addObject:newCupping];
    
    [self.dataController.coffees addObject:newCoffee];
    
    [self.dataController save];
    
    CoffeesViewController *coffeesViewController = segue.destinationViewController;
    
    [coffeesViewController.dataController.coffees addObject:newCoffee];
}

-(void)viewDidDisappear:(BOOL)animated {
    
}

//- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newText = [theTextField.text
//                         stringByReplacingCharactersInRange:range withString:string];
//    self.saveBarButton.enabled = ([newText length] > 0);
//    
//    return YES;
//}

@end
