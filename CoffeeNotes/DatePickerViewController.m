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

@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        destination.cuppingDateHolder = self.datePickerDate;
    }
}

@end
