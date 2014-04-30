//
//  ViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CoffeesViewController.h"
#import "CoffeeDetailViewController.h"
#import "DataController.h"
#import "CoffeeCell.h"

@interface CoffeesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *coffeesTableView;
@property (nonatomic, weak) Coffee *coffee;

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
    // Dispose of any resources that can be recreated.
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
    
    if ([segue.identifier isEqualToString:@"CoffeesToCoffeeDetailSegue"]) {
        CoffeeDetailViewController *destination = segue.destinationViewController;
        destination.dataController = self.dataController;
        destination.coffee = [_dataController.coffees objectAtIndex:[self.coffeesTableView indexPathForSelectedRow].row];
    }
}

-(IBAction)exitSegue:(UIStoryboardSegue *)sender
{
    [self.dataController save];
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
    cell.coffeeNameLabel.text = [NSString stringWithFormat:@"%@", coffee.nameOrOrigin];
    cell.roasterLabel.text = [NSString stringWithFormat:@"%@", coffee.roaster];
    
    cell.coffeeImage.layer.cornerRadius = 22;
    cell.coffeeImage.layer.masksToBounds = YES;
    cell.coffeeImage.image = coffee.mostRecentCoffeeImage;
    
    return cell;
}

@end
