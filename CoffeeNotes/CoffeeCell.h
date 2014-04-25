//
//  CoffeeCell.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;
@property (weak, nonatomic) IBOutlet UIView *coffeeRating;
@property (weak, nonatomic) IBOutlet UIImageView *coffeeImage;



@end
