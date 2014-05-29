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
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CoffeeDatePickerDoneExitSegue"]) {
        
        AddOrEditCoffeeViewController *destination = segue.destinationViewController;
        
        if ([_segueKey isEqualToString:@"PickCuppingDateFromCoffee"]) {
            
            destination.cuppingDateHolder = _datePicker.date;
            [destination.chooseCuppingDateButton setTitle:[[DataController sharedController]createStringFromDate:_datePicker.date] forState:UIControlStateNormal];
            destination.saveBarButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (destination.cuppingDateHolder != nil);
            destination.mainViewSaveButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (destination.cuppingDateHolder != nil);
            
        } else if ([_segueKey isEqualToString:@"PickRoastDateFromCoffee"]) {
            
            destination.roastDateHolder = _datePicker.date;
            [destination.chooseRoastDateButton setTitle:[[DataController sharedController]createStringFromDate:_datePicker.date] forState:UIControlStateNormal];
        }
    }
}

@end
