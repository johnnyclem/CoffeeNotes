//
//  DatePickerViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/12/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CoffeeDatePickerViewController.h"
#import "AddOrEditCoffeeViewController.h"

@interface CoffeeDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation CoffeeDatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CoffeeDatePickerDoneExitSegue"]) {
        
        AddOrEditCoffeeViewController *destination = segue.destinationViewController;
        
        if ([self.segueKey isEqualToString:@"PickCuppingDateFromCoffee"]) {
            
            destination.coffeeCuppingDateHolder = self.datePicker.date;
            [destination.chooseCuppingDateButtonFromCoffee setTitle:[[DataController sharedController]createStringFromDate:self.datePicker.date] forState:UIControlStateNormal];
            destination.saveBarButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (destination.coffeeCuppingDateHolder != nil);
            destination.mainViewSaveButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (destination.coffeeCuppingDateHolder != nil);
            
        } else if ([self.segueKey isEqualToString:@"PickRoastDateFromCoffee"]) {
            
            destination.coffeeRoastDateHolder = self.datePicker.date;
            [destination.chooseRoastDateButtonFromCoffee setTitle:[[DataController sharedController]createStringFromDate:self.datePicker.date] forState:UIControlStateNormal];
        }
    }
}

@end
