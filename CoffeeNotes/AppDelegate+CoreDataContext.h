//
//  CoreDataContext.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/16/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CoreDataContext)

-(void)createManagedObjectContext:(void (^)(NSManagedObjectContext *context))completion;

@end
