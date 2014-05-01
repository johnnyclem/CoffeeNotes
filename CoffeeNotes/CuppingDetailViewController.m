//
//  CuppingDetailViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "CuppingDetailViewController.h"
#import "AddOrEditCuppingViewController.h"

@interface CuppingDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *locationDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuppingDateDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *roastDateDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *brewingMethodDisplayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextField;


@end

@implementation CuppingDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditCuppingSegue"]) {
        AddOrEditCuppingViewController *destination = segue.destinationViewController;
        destination.currentCupping = self.cupping;
        
    }
}

@end
