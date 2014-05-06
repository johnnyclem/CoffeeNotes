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

@interface CoffeesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *coffeesTableView;

@property (weak, nonatomic) Coffee *coffee;

@end


@implementation CoffeesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataController = [[DataController alloc] initWithCoffees];

    self.coffeesTableView.delegate = self;
    self.coffeesTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_dataController sortByCoffeeNameOrOrigin];
    [self.coffeesTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSIndexPath *indexPath = [self.coffeesTableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"CoffeeDetailSegue"]) {
        CoffeeDetailViewController *destination = segue.destinationViewController;
        destination.coffeeDetailDataController = self.dataController;
        destination.coffeeDetailCoffee = [self.dataController.coffees objectAtIndex:[self.coffeesTableView indexPathForSelectedRow].row];
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
    return self.dataController.coffees.count;
}

-(CoffeeCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoffeeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CoffeeCell" forIndexPath:indexPath];
    Coffee *coffee = [self.dataController.coffees objectAtIndex:indexPath.row];
    cell.coffeeCellNameOrOriginLabel.text = [NSString stringWithFormat:@"%@", coffee.nameOrOrigin];
    cell.coffeeCellRoasterLabel.text = [NSString stringWithFormat:@"%@", coffee.roaster];
    
    cell.coffeeCellImage.layer.cornerRadius = 22;
    cell.coffeeCellImage.layer.masksToBounds = YES;
    cell.coffeeCellImage.image = coffee.mostRecentCoffeeImage;
    
    return cell;
}

@end
