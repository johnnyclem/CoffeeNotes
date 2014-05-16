//
//  CuppingDatePickerViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/15/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CuppingDatePickerViewController.h"
#import "AddOrEditCuppingViewController.h"

@interface CuppingDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation CuppingDatePickerViewController

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
    if ([segue.identifier isEqualToString:@"CuppingDatePickerDoneExitSegue"]) {
        
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        
        if ([self.segueKey isEqualToString:@"PickCuppingDateFromCupping"]) {
            
            destination.cuppingCuppingDateHolder = self.datePicker.date;
            destination.chooseCuppingDateFromCuppingButton.titleLabel.text = [[DataController sharedController]createStringFromDate:self.datePicker.date];
            destination.mainViewSaveButton.enabled = (![destination.chooseCuppingDateFromCuppingButton.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
            destination.navigationBarSaveButton.enabled = (![destination.chooseCuppingDateFromCuppingButton.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
            
        } else if ([self.segueKey isEqualToString:@"PickRoastDateFromCupping"]) {
            
            destination.cuppingRoastDateHolder = self.datePicker.date;
            destination.chooseRoastDateFromCuppingButton.titleLabel.text = [[DataController sharedController]createStringFromDate:self.datePicker.date];
        }
    }
}

@end

