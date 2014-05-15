//
//  DataController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/28/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "DataController.h"
#import "CoffeeCell.h"
#import "CuppingCell.h"
#import "AppDelegate+CoreDataContext.h"

#define dataSourcePListPath [[DataController applicationDocumentsDirectory] stringByAppendingPathComponent:@"DataSourcePropertyList.plist" ]

@interface DataController ()

@property (weak, nonatomic) NSManagedObjectContext *objectContext;

@end


@implementation DataController


#pragma mark - Init Methods

+(DataController *)sharedController
{
    static dispatch_once_t pred;
    static DataController *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[DataController alloc] init];
    });
    return shared;
}

+(NSString *)applicationDocumentsDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}


#pragma mark - Management Methods

-(NSArray *)fetchAllCoffees
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Coffee"];
    
    NSError *error;
    
    NSArray *fetchedCoffees = [self.objectContext executeFetchRequest:fetchRequest error:&error];

    NSLog(@"Coffee Count: %d", fetchedCoffees.count);
    NSLog(@"All Coffees: %@", fetchedCoffees);
    return fetchedCoffees;
}

//-(NSArray *)fetchAllCuppingsForCoffee:(Coffee *)coffee
//{
//    
//}


#pragma mark - Calculation Methods

- (NSNumber *)averageRatingFromCuppingRatingInCoffee:(Coffee *)coffee
{
    CGFloat sumOfRatingsInCuppings;
   
   for (Cupping *cupping in coffee.cuppings)
   {
       CGFloat rating = cupping.rating.floatValue;
       sumOfRatingsInCuppings += rating;
   }
    
    return [NSNumber numberWithFloat:sumOfRatingsInCuppings/(CGFloat)coffee.cuppings.count];
}


#pragma mark - Sorting Methods

-(void)sortByCoffeeNameOrOrigin
{
    NSSortDescriptor *nameOrOriginSortDescriptor = [[NSSortDescriptor alloc]
                                                initWithKey:@"nameOrOrigin" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    self.coffees = [[self.coffees sortedArrayUsingDescriptors:@[nameOrOriginSortDescriptor]]mutableCopy];
}

//-(void)sortByCuppingDateInCoffee:(Coffee *)coffee;
//{
//    NSSortDescriptor *cuppingDateSortDescriptor = [[NSSortDescriptor alloc]
//                                                    initWithKey:@"cuppingDate" ascending:YES selector:@selector(localizedStandardCompare:)];
//    
//    coffee.cuppings = [[coffee.cuppings sortedArrayUsingDescriptors:@[cuppingDateSortDescriptor]]mutableCopy];
//}


#pragma mark - Temporary/Test Methods

- (void)seedInitialDataWithCompletion:(void (^)())block
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate createManagedObjectContext:^(NSManagedObjectContext *context) {
        
        self.objectContext = context;
        
//        Coffee *seattleCoffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:self.objectContext];
//        seattleCoffee.nameOrOrigin = @"Ethiopian Yergecheffe";
//        seattleCoffee.roaster = @"Conduit Coffee";
//        
//        Coffee *kentuckeyCoffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:self.objectContext];
//        kentuckeyCoffee.nameOrOrigin = @"House Blend";
//        kentuckeyCoffee.roaster = @"Moonshine Coffee Roasters";
//        
//        Coffee *frenchCoffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:self.objectContext];
//        frenchCoffee.nameOrOrigin = @"French Roast (Obviously)";
//        frenchCoffee.roaster = @"Le Caffee du Chat";
//        
//        NSError *error;
//        
//        [self.objectContext save:&error];
//        
//        if (error) {
//            NSLog(@"error: %@", error.localizedDescription);
//        }
        
        block();
        
    }];

}

-(NSString *)createStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    NSString *dateString = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:date]];
    return dateString;
}


@end
