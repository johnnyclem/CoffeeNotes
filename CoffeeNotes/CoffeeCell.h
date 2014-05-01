//
//  CoffeeCell.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *coffeeCellNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *coffeeCellRoasterLabel;
@property (weak, nonatomic) IBOutlet UIView *coffeeCellAverageRating;
@property (weak, nonatomic) IBOutlet UIImageView *coffeeCellImage;

@end
