//
//  Coffee.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/16/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "Coffee.h"
#import "Cupping.h"


@implementation Coffee

@dynamic averageRating;
@dynamic nameOrOrigin;
@dynamic roaster;
@dynamic cuppings;

@synthesize photo = _photo;

- (UIImage *)photo
{
    UIImage *mostRecentPhoto;
    
    for (Cupping *cupping in self.cuppings.allObjects.reverseObjectEnumerator.allObjects) {
        if (cupping.photoPath) {
            mostRecentPhoto = cupping.photo;
        }
    }

    return mostRecentPhoto;
}

@end
