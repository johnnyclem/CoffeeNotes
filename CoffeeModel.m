//
//  Coffee.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/24/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CoffeeModel.h"

@implementation CoffeeModel

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.nameOrOrigin           = [aDecoder decodeObjectForKey:@"nameOrOrigin"];
        self.roaster                = [aDecoder decodeObjectForKey:@"roaster"];
        self.mostRecentCoffeeImage  = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
        self.averageRating          = [aDecoder decodeObjectForKey:@"averageRating"];
        self.cuppings               = [aDecoder decodeObjectForKey:@"cuppings"];
        if (!self.cuppings)
        {
            self.cuppings = [NSMutableArray new];
        }
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nameOrOrigin      forKey:@"nameOrOrigin"];
    [aCoder encodeObject:self.roaster           forKey:@"roaster"];
    [aCoder encodeObject:self.averageRating     forKey:@"averageRating"];
    [aCoder encodeObject:UIImagePNGRepresentation(self.mostRecentCoffeeImage) forKey:@"image"];
    [aCoder encodeObject:self.cuppings          forKey:@"cuppings"];

}


@end
