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

@interface CoffeeDetailViewController () 

// Navigation Bar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *coffeeDetailEditButton;

// Outlets
@property (weak, nonatomic) IBOutlet UIView *coffeeDetailMainView;
@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeRoasterLabel;
@property (weak, nonatomic) IBOutlet UIView *coffeeRatingView;
@property (weak, nonatomic) IBOutlet UICollectionView *coffeePhotosCollectionView;
@property (weak, nonatomic) IBOutlet UIView *coffeeTastingWheelView;
@property (weak, nonatomic) IBOutlet UITableView *coffeeCuppingsTableView;
@property (weak, nonatomic) IBOutlet UIButton *coffeeAddNewCuppingButton;

// Objects
@property (weak, nonatomic) Cupping *cupping;

@end

@implementation CoffeeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.coffeeNameOrOriginLabel.text = self.coffee.nameOrOrigin;
    self.coffeeRoasterLabel.text = self.coffee.roaster;
    
    self.coffeeCuppingsTableView.delegate = self;
    self.coffeeCuppingsTableView.dataSource = self;
    
//    self.coffeeratingview = self.coffee.averageRating;
//    self.coffeePhotosCollectionView
//    self.coffeeTastingWheelView
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coffee.cuppings.count;
}

-(CuppingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CuppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CuppingCell" forIndexPath:indexPath];
    Cupping *cupping = [self.coffee.cuppings objectAtIndex:indexPath.row];
    cell.cuppingDateLabel.text = [NSString stringWithFormat:@"%@", cupping.cuppingDate];
    cell.locationLabel.text = [NSString stringWithFormat:@"%@", cupping.location];
    
    cell.cuppingCellImageView.layer.cornerRadius = 22;
    cell.cuppingCellImageView.layer.masksToBounds = YES;
    cell.cuppingCellImageView.image = cupping.image;
    
    return cell;
}



@end
