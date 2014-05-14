//
//  CuppingDetailViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CuppingDetailViewController.h"
#import "AddOrEditCuppingViewController.h"

@interface CuppingDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeRoasterLabel;

@property (weak, nonatomic) IBOutlet UILabel *locationDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuppingDateDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *roastDateDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *brewingMethodDisplayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextField;


@end

@implementation CuppingDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // labels
    self.coffeeNameOrOriginLabel.text       = self.selectedCoffee.nameOrOrigin;
    self.coffeeRoasterLabel.text            = self.selectedCoffee.roaster;

    // text fields
    self.locationDisplayLabel.text          = self.selectedCupping.location;
    self.cuppingDateDisplayLabel.text       = [[DataController sharedController] createStringFromDate:self.selectedCupping.cuppingDate];
    self.roastDateDisplayLabel.text         = [[DataController sharedController] createStringFromDate:self.selectedCupping.roastDate];
    self.brewingMethodDisplayLabel.text     = self.selectedCupping.brewingMethod;
    self.notesTextField.text                = self.selectedCupping.cuppingNotes;
    
    // views and imageViews
    self.photoImageView.image               = self.selectedCupping.photo;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditCuppingSegue"]) {
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        destination.editableCupping = self.selectedCupping;
        destination.selectedCoffee = self.selectedCoffee;
    }
}

@end
