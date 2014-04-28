//
//  DataController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/28/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataController : NSObject

@property (nonatomic, strong) NSMutableArray *coffees;


+ (DataController *)sharedData;

- (instancetype)initWithCoffeeAndCuppings;

- (void)addCoffee;
- (void)addCuppingToCoffee;
- (void)deleteCoffee;
- (void)deleteCupping;
- (void)sortByCoffeeNameOrOrigin;
- (void)sortByCuppingDate;

- (void)save;


@end
