//
//  DatePickerViewController.h
//  CoffeeNotes
//
//  Created by Cole Bratcher on 5/12/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController


@property (nonatomic, strong) NSString *segueKey;

@property (strong, nonatomic) NSDate *datePickerCuppingDateFromCupping;
@property (strong, nonatomic) NSDate *datePickerRoastDateFromCupping;


@end
