//
//  DatePickerViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/12/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AddOrEditCoffeeViewController.h"
#import "AddOrEditCuppingViewController.h"

@interface DatePickerViewController ()

@property (nonatomic, strong) NSDate *datePickerDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if (self.datePickerCuppingDateFromCupping) {
//        
//    } else if (self.datePickerRoastDateFromCupping) {
//        
//    }
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
            destination.cuppingDateHolder = self.datePicker.date;
            destination.chooseCuppingDateButton.titleLabel.text = [[DataController sharedController]createStringFromDate:self.datePicker.date];
            destination.saveBarButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (![destination.chooseCuppingDateButton.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
            destination.mainViewSaveButton.enabled = (destination.nameOrOriginTextField.text.length > 0) && (![destination.chooseCuppingDateButton.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
        } else if ([self.segueKey isEqualToString:@"PickRoastDateFromCoffee"]) {
            destination.roastDateHolder = self.datePicker.date;
            destination.chooseRoastDateButton.titleLabel.text = [[DataController sharedController]createStringFromDate:self.datePicker.date];
        }
    }
}

@end
