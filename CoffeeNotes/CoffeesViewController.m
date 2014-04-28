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

@interface CoffeesViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *coffeesNavigationBar;
@property (weak, nonatomic) IBOutlet UITableView *coffeesTableView;
@property (nonatomic, strong) DataController *dataController;

@end

@implementation CoffeesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataController = [DataController new];

    self.coffeesTableView.delegate = self;
    self.coffeesTableView.dataSource = self.dataController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CoffeesToCoffeeDetailSegue"]) {
        CoffeeDetailViewController *destination = segue.destinationViewController;
//        add datasource and object information
    }
}

@end
