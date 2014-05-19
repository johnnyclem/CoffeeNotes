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
        
        if ([_segueKey isEqualToString:@"PickCuppingDateFromCupping"]) {
            
            destination.cuppingDateHolder = _datePicker.date;
            [destination.chooseCuppingDateFromCuppingButton setTitle:[[DataController sharedController]createStringFromDate:_datePicker.date] forState:UIControlStateNormal];
            destination.mainViewSaveButton.enabled = (destination.cuppingDateHolder != nil);
            destination.navigationBarSaveButton.enabled = (destination.cuppingDateHolder != nil);
            
        } else if ([_segueKey isEqualToString:@"PickRoastDateFromCupping"]) {
            
            destination.roastDateHolder = _datePicker.date;
            [destination.chooseRoastDateFromCuppingButton setTitle:[[DataController sharedController]createStringFromDate:_datePicker.date] forState:UIControlStateNormal];
        }
    }
}

@end

