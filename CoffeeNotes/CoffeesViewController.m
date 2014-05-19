//
//  ViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CoffeesViewController.h"
#import "CoffeeDetailViewController.h"
#import "CoffeeCell.h"
#import "Coffee.h"
#import "AppDelegate+CoreDataContext.h"

@interface CoffeesViewController () <UITableViewDelegate, UITableViewDataSource>

// models
@property (weak, nonatomic) Coffee *coffee;

// views

// arrays
@property (strong, nonatomic) NSArray *coffees;

@property (weak, nonatomic) NSManagedObjectContext *objectContext;

@end


@implementation CoffeesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _coffeesTableView.delegate = self;
    _coffeesTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[DataController sharedController] seedInitialDataWithCompletion:^{
        _coffees = [[DataController sharedController] fetchAllCoffees];
        
        [_coffeesTableView reloadData];
    }];
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"CoffeeDetailSegue"]) {
        CoffeeDetailViewController *destination = segue.destinationViewController;
        NSIndexPath *indexPath = [self.coffeesTableView indexPathForSelectedRow];
        destination.selectedCoffee = self.coffees[indexPath.row];
    }
}

-(IBAction)addCoffeeExitSegue:(UIStoryboardSegue *)sender
{
    // Empty method for Exit Segue functionality.
}

- (IBAction)deleteCoffeeSegue:(UIStoryboardSegue *)sender
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
    return self.coffees.count;
}

-(CoffeeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoffeeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoffeeCell" forIndexPath:indexPath];
    Coffee *coffee = [_coffees objectAtIndex:indexPath.row];
    cell.coffeeCellNameOrOriginLabel.text = [NSString stringWithFormat:@"%@", coffee.nameOrOrigin];
    cell.coffeeCellRoasterLabel.text = [NSString stringWithFormat:@"%@", coffee.roaster];
    
    [cell.coffeeCellAverageRating sizeToFit];
    [cell.coffeeCellAverageRating setStepInterval:0.5];
    [cell.coffeeCellAverageRating setUserInteractionEnabled:NO];
    
    cell.coffeeCellAverageRating.value = [[[DataController sharedController]averageRatingFromCuppingRatingInCoffee:coffee]floatValue];
    if (![[[DataController sharedController]averageRatingFromCuppingRatingInCoffee:coffee]floatValue]) {
        cell.coffeeCellAverageRating.value = 0.0;
    }
    [cell.coffeeCellAverageRating sizeToFit];
    [cell.coffeeCellAverageRating setStepInterval:0.5];
    [cell.coffeeCellAverageRating setUserInteractionEnabled:NO];
    
    coffee.mostRecentPhoto = [[DataController sharedController]mostRecentImageInCoffee:coffee];
    
    cell.coffeeCellImage.layer.cornerRadius = 11;
    cell.coffeeCellImage.layer.masksToBounds = YES;
    cell.coffeeCellImage.image = coffee.mostRecentPhoto;
    
    return cell;
}

@end
