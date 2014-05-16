//
//  DatePickerViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/12/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeDatePickerViewController : UIViewController

@property (nonatomic, strong) NSString *segueKey;
@property (nonatomic, strong) NSDate *datePickerDate;

@end
