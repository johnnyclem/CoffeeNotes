//
//  CFAppDelegate+CoreDataContext.h
//  coredataexample
//
//  Created by Brad Johnson on 5/7/14.
//  Copyright (c) 2014 Brad Johnson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (CoreDataContext)

-(void)createManagedObjectContext:(void (^)(NSManagedObjectContext *context))completion;


@end
