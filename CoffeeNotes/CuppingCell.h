//
//  CuppingCell.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/29/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CuppingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cuppingCellDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuppingCellLocationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cuppingCellImageView;

@end
