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
#import "AddOrEditCuppingViewController.h"

@interface CoffeeDetailViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

// Navigation Bar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

// Outlets
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *nameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (weak, nonatomic) IBOutlet UIView *tastingWheelView;
@property (weak, nonatomic) IBOutlet UITableView *cuppingsTableView;
@property (weak, nonatomic) IBOutlet UIButton *addNewCuppingButton;

// Objects
@property (weak, nonatomic) Cupping *cupping;

@end

@implementation CoffeeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameOrOriginLabel.text = self.coffeeDetailCoffee.nameOrOrigin;
    self.roasterLabel.text = self.coffeeDetailCoffee.roaster;
    
    self.cuppingsTableView.delegate = self;
    self.cuppingsTableView.dataSource = self;
    
//    self.coffeeratingview = self.coffee.averageRating;
//    self.coffeePhotosCollectionView
//    self.coffeeTastingWheelView
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.cuppingsTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CuppingDetailSegue"]) {
        
        CuppingDetailViewController *destination = segue.destinationViewController;
        destination.dataController = self.coffeeDetailDataController;
        destination.cupping = [self.coffeeDetailCoffee.cuppings objectAtIndex:[self.cuppingsTableView indexPathForSelectedRow].row];
        
    } else if ([segue.identifier isEqualToString:@"AddCuppingSegue"]) {
        
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        destination.addOrEditCuppingDataController = self.coffeeDetailDataController;
        destination.currentCoffee = self.coffeeDetailCoffee;
    }
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
