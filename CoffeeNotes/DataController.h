//
//  DataController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/28/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"

@interface DataController : NSObject

@property (strong, nonatomic) NSMutableArray *coffees;

+(DataController *)sharedController;

// Init

+(NSString *)applicationDocumentsDirectory;
-(instancetype)initWithCoffees;
//-(instancetype)initwithCuppingsFromCoffee:(Coffee *)coffee;


// Edit
//-(void)addCoffee:(Coffee *)newCoffee;
//-(void)addCupping:(Cupping *)newCupping ToCoffee:(Coffee *)coffee;
//-(void)deleteCoffee:(Coffee *)coffeeToDelete;
//-(void)deleteCupping:(Cupping *)cuppingToDelete FromCoffee:(Coffee *)coffee;

// Management
-(NSNumber *)averageRatingFromCuppingRatingInCoffee:(Coffee *)coffee;
-(void)sortByCoffeeNameOrOrigin;
-(void)sortByCuppingDateInCoffee:(Coffee *)coffee;

-(void)save;

@end
