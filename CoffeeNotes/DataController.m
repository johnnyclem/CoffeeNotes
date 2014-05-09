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

#define dataSourcePListPath [[DataController applicationDocumentsDirectory] stringByAppendingPathComponent:@"DataSourcePropertyList.plist" ]


@implementation DataController

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

//-(void)addCoffee:(Coffee *)newCoffee
//{
//    [self.coffees addObject:newCoffee];
//}
//
//-(void)addCupping:(Cupping *)newCupping ToCoffee:(Coffee *)coffee
//{
//    [coffee.cuppings addObject:newCupping];
//}
//
//-(void)deleteCoffee:(Coffee *)coffeeToDelete
//{
//    [self.coffees removeObject:coffeeToDelete];
//}
//
//-(void)deleteCupping:(Cupping *)cuppingToDelete FromCoffee:(Coffee *)coffee
//{
//    [coffee.cuppings removeObject:cuppingToDelete];
//}

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

-(void)sortByCoffeeNameOrOrigin
{
    NSSortDescriptor *nameOrOriginSortDescriptor = [[NSSortDescriptor alloc]
                                                initWithKey:@"nameOrOrigin" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    self.coffees = [[self.coffees sortedArrayUsingDescriptors:@[nameOrOriginSortDescriptor]]mutableCopy];
}

-(void)sortByCuppingDateInCoffee:(Coffee *)coffee;
{
    NSSortDescriptor *cuppingDateSortDescriptor = [[NSSortDescriptor alloc]
                                                    initWithKey:@"cuppingDate" ascending:YES selector:@selector(localizedStandardCompare:)];
    
    coffee.cuppings = [[coffee.cuppings sortedArrayUsingDescriptors:@[cuppingDateSortDescriptor]]mutableCopy];
}

//- (void)save
//{
//    // change to telling the context to save
//    [NSKeyedArchiver archiveRootObject:self.coffees toFile:dataSourcePListPath];
//}

//- (instancetype)initWithSampleCoreData
//{
//    self = [super init];
//    
//    Coffee *gangstaCoffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:self.objectContext];
//    rapLabel.name = @"Gangsta P";
//    Label *countryLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
//    countryLabel.name = @"Cowboy Hats";
//    
//    Label *popLabel = [NSEntityDescription insertNewObjectForEntityForName:@"Label" inManagedObjectContext:self.objectContext];
//    popLabel.name = @"Lolipopcorn";
//    NSError *error;
//    
//    [self.objectContext save:&error];
//    
//    if (error)
//    {
//        NSLog(@"error: %@", error.localizedDescription);
//    }
//
//
//}

//-(instancetype)initWithCoffees
//{
//    self = [super init];
//    
//    self.coffees = [[NSMutableArray alloc] init];
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:dataSourcePListPath]){
//        self.coffees = [[NSKeyedUnarchiver unarchiveObjectWithFile:dataSourcePListPath] mutableCopy];
//    } else {
//        NSString *pListBundlePath = [[NSBundle mainBundle] pathForResource:@"DataSourcePropertyList" ofType:@"plist"];
//        NSDictionary *rootDictionary = [[NSDictionary alloc] initWithContentsOfFile:pListBundlePath];
//        
//        NSMutableArray *tempCoffeesArray = [rootDictionary objectForKey:@"Coffees"];
//        
//        for (NSDictionary *coffeeDictionary in tempCoffeesArray) {
//            CoffeeModel *newCoffee = [CoffeeModel new];
//            newCoffee.nameOrOrigin  = [coffeeDictionary objectForKey:@"nameOrOrigin"];
//            newCoffee.roaster       = [coffeeDictionary objectForKey:@"roaster"];
//            newCoffee.averageRating = [coffeeDictionary objectForKey:@"averageRating"];
//            newCoffee.cuppings      = [[coffeeDictionary objectForKey:@"Cuppings"] mutableCopy];
//            
//            for (NSDictionary *cuppingDictionary in newCoffee.cuppings) {
//                CuppingModel *newCupping = [CuppingModel new];
//                newCupping.cuppingNameOrOrigin  = [cuppingDictionary objectForKey:@"cuppingNameOrOrigin"];
//                newCupping.cuppingRoaster       = [cuppingDictionary objectForKey:@"cuppingRoaster"];
//                newCupping.cuppingDate          = [cuppingDictionary objectForKey:@"cuppingDate"];
//                newCupping.location             = [cuppingDictionary objectForKey:@"location"];
//                newCupping.roastDate            = [cuppingDictionary objectForKey:@"roastDate"];
//                newCupping.brewingMethod        = [cuppingDictionary objectForKey:@"brewingMethod"];
//                newCupping.cuppingRating        = [cuppingDictionary objectForKey:@"cuppingRating"];
//                
//                [newCoffee.cuppings addObject:newCupping];
//            }
//            [self.coffees addObject:newCoffee];
//        }
//        [self save];
//    }
//    NSLog(@"%@", self.coffees);
//    
//    return self;
//}

@end
