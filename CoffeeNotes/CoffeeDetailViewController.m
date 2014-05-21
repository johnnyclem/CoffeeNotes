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

@interface CoffeeDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) Cupping *cupping;
@property (strong, nonatomic) NSArray *cuppings;

// labels
@property (weak, nonatomic) IBOutlet UILabel *nameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *addNewCuppingButton;

// views
@property (weak, nonatomic) IBOutlet AXRatingView *averageStarRatingView;
@property (weak, nonatomic) IBOutlet UIImageView *mostRecentPhotoImageView;
@property (weak, nonatomic) IBOutlet UITableView *cuppingsTableView;

@end


@implementation CoffeeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nameOrOriginLabel.text     = _selectedCoffee.nameOrOrigin;
    _roasterLabel.text          = _selectedCoffee.roaster;
    
    _cuppingsTableView.delegate     = self;
    _cuppingsTableView.dataSource   = self;
    
    [_averageStarRatingView sizeToFit];
    [_averageStarRatingView setStepInterval:0.5];
    [_averageStarRatingView setUserInteractionEnabled:NO];
    
    _nameOrOriginLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:47.0];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _cuppings = [_selectedCoffee.cuppings allObjects];
    
    _averageStarRatingView.value = [[[DataController sharedController] averageRatingFromCuppingRatingInCoffee:_selectedCoffee]floatValue];
    
    if (![[[DataController sharedController]averageRatingFromCuppingRatingInCoffee:_selectedCoffee]floatValue]) {
        _averageStarRatingView.value = 0.0;
    }
    
    _mostRecentPhotoImageView.image = [[DataController sharedController]mostRecentImageInCoffee:_selectedCoffee];
    _mostRecentPhotoImageView.layer.cornerRadius = 11;
    _mostRecentPhotoImageView.layer.masksToBounds = YES;
    
    [_cuppingsTableView reloadData];
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
        destination.selectedCoffee = _selectedCoffee;
        
        NSIndexPath *indexPath = [_cuppingsTableView indexPathForSelectedRow];
        destination.selectedCupping = _cuppings[indexPath.row];
        
    } else if ([segue.identifier isEqualToString:@"AddCuppingSegue"]) {
        
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        destination.selectedCoffee = _selectedCoffee;
        
    } else if ([segue.identifier isEqualToString:@"EditCoffeeSegue"]) {
        
        AddOrEditCoffeeViewController *destination = segue.destinationViewController;
        destination.editableCoffee = _selectedCoffee;
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
    return _selectedCoffee.cuppings.count;
}

-(CuppingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CuppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CuppingCell" forIndexPath:indexPath];
    
    NSLog(@"%ld",(long)indexPath.row);
    
    Cupping *cupping = [_cuppings objectAtIndex:indexPath.row];
    cell.cuppingCellDateLabel.text = [[DataController sharedController] createStringFromDate:cupping.cuppingDate];
    cell.cuppingCellLocationLabel.text = [NSString stringWithFormat:@"%@", cupping.location];
    
    cell.cuppingCellImageView.layer.cornerRadius = 5;
    cell.cuppingCellImageView.layer.masksToBounds = YES;
    cell.cuppingCellImageView.image = cupping.photo;
    
    return cell;
}

@end
