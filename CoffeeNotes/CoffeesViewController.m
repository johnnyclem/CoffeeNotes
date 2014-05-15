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
@property (weak, nonatomic) IBOutlet UITableView *coffeesTableView;

// arrays
@property (strong, nonatomic) NSArray *coffees;

@property (weak, nonatomic) NSManagedObjectContext *objectContext;

@end


@implementation CoffeesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coffeesTableView.delegate = self;
    self.coffeesTableView.dataSource = self;

    [[DataController sharedController] seedInitialDataWithCompletion:^{
        
        self.coffees = [[DataController sharedController] fetchAllCoffees];
        
        [self.coffeesTableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    self.coffees = [[DataController sharedController] fetchAllCoffees];
    [[DataController sharedController] sortByCoffeeNameOrOrigin];
    [self.coffeesTableView reloadData];
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
    Coffee *coffee = [self.coffees objectAtIndex:indexPath.row];
    cell.coffeeCellNameOrOriginLabel.text = [NSString stringWithFormat:@"%@", coffee.nameOrOrigin];
    cell.coffeeCellRoasterLabel.text = [NSString stringWithFormat:@"%@", coffee.roaster];
    
    cell.coffeeCellImage.layer.cornerRadius = 22;
    cell.coffeeCellImage.layer.masksToBounds = YES;
    cell.coffeeCellImage.image = coffee.mostRecentPhoto;
    
    return cell;
}

@end
