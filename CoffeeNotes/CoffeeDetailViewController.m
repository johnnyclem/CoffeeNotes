//
//  CoffeeDetailViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CoffeeDetailViewController.h"
#import "DataController.h"
#import "CuppingCell.h"
#import "CuppingDetailViewController.h"
#import "AddOrEditCoffeeViewController.h"
#import "AddOrEditCuppingViewController.h"
#import <AXRatingView/AXRatingView.h>

@interface CoffeeDetailViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

// models
@property (weak, nonatomic) Cupping *cupping;

// labels
@property (weak, nonatomic) IBOutlet UILabel *nameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;

// buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIButton *addNewCuppingButton;


// views and imageViews

@property (weak, nonatomic) IBOutlet AXRatingView *averageStarRatingView;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (weak, nonatomic) IBOutlet UIView *tastingWheelView;
@property (weak, nonatomic) IBOutlet UITableView *cuppingsTableView;

@end


@implementation CoffeeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameOrOriginLabel.text = self.coffeeDetailCoffee.nameOrOrigin;
    self.roasterLabel.text = self.coffeeDetailCoffee.roaster;
    
    self.cuppingsTableView.delegate = self;
    self.cuppingsTableView.dataSource = self;
    
    [self.averageStarRatingView sizeToFit];
    [self.averageStarRatingView setStepInterval:0.5];
    [self.averageStarRatingView setUserInteractionEnabled:NO];
    
    self.averageStarRatingView.value = [[[DataController sharedController] averageRatingFromCuppingRatingInCoffee:self.coffeeDetailCoffee] floatValue];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.cuppingsTableView reloadData];
    
    self.averageStarRatingView.value = [[[DataController sharedController] averageRatingFromCuppingRatingInCoffee:self.coffeeDetailCoffee] floatValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CuppingDetailSegue"]) {
        
        CuppingDetailViewController *destination = segue.destinationViewController;
        destination.dataController = self.coffeeDetailDataController;
        destination.currentCoffee = self.coffeeDetailCoffee;
        destination.currentCupping = [self.coffeeDetailCoffee.cuppings objectAtIndex:[self.cuppingsTableView indexPathForSelectedRow].row];
        
    } else if ([segue.identifier isEqualToString:@"AddCuppingSegue"]) {
        
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        destination.addOrEditCuppingDataController = self.coffeeDetailDataController;
        destination.currentCoffee = self.coffeeDetailCoffee;
        
    } else if ([segue.identifier isEqualToString:@"EditCoffeeSegue"]) {
        
        AddOrEditCoffeeViewController *destination = segue.destinationViewController;
        destination.dataController = self.coffeeDetailDataController;
        destination.editableCoffee = self.coffeeDetailCoffee;
    }
}

-(IBAction)addCuppingExitSegue:(UIStoryboardSegue *)sender
{
    // Empty method for Exit Segue functionality.
}

- (IBAction)deleteCuppingSegue:(UIStoryboardSegue *)sender
{
    // Empty method for Exit Segue functionality.
}

#pragma mark - UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coffeeDetailCoffee.cuppings.count;
}

-(CuppingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CuppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CuppingCell" forIndexPath:indexPath];
    Cupping *cupping = [self.coffeeDetailCoffee.cuppings objectAtIndex:indexPath.row];
    cell.cuppingCellDateLabel.text = [NSString stringWithFormat:@"%@", cupping.cuppingDate];
    cell.cuppingCellLocationLabel.text = [NSString stringWithFormat:@"%@", cupping.location];
    
    cell.cuppingCellImageView.layer.cornerRadius = 22;
    cell.cuppingCellImageView.layer.masksToBounds = YES;
    cell.cuppingCellImageView.image = cupping.image;
    
    return cell;
}

@end
