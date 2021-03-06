//
//  Cupping.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/16/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "Cupping.h"
#import "Coffee.h"


@implementation Cupping

@dynamic brewingMethod;
@dynamic cuppingDate;
@dynamic cuppingNotes;
@dynamic location;
@dynamic nameOrOrigin;
@dynamic rating;
@dynamic roastDate;
@dynamic roaster;
@dynamic coffee;
@dynamic photoPath;

@synthesize photo = _photo;

- (UIImage *)photo
{
    NSLog(@"Requesting Cupping Photo");
    if (!_photo) {
        NSLog(@"Didn't have a photo");
        NSLog(@"Loading from path: %@", self.photoPath);
        _photo = [UIImage imageWithContentsOfFile:self.photoPath];
    }
    
    return _photo;
}

- (void)setPhoto:(UIImage *)photo
{
    NSError *error;
    NSUUID *UUID = [NSUUID UUID];
    NSString *UUIDString = [UUID UUIDString];
    NSData *imageData = UIImageJPEGRepresentation(photo, 0.4);
    self.photoPath = [[[self docsDirectory] stringByAppendingPathComponent:UUIDString] stringByAppendingPathExtension:@"jpg"];
    if ([self.managedObjectContext save:&error]) {
        if (error) {
            NSLog(@"Error setting photo on cupping: %@", error.localizedDescription);
        } else {
            NSLog(@"Saved photo path to cupping: %@", self.photoPath);
            if ([imageData writeToFile:self.photoPath atomically:YES]) {
                NSLog(@"Saved File To Docs Directory: %@", self.photoPath);
                _photo = [UIImage imageWithContentsOfFile:self.photoPath];
            }
        }
    }
    
}

- (NSString *)docsDirectory
{
    NSURL *docsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                             inDomains:NSUserDomainMask] firstObject];
    return docsURL.path;
}

@end
