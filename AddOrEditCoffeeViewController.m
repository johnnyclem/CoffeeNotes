//
//  NueueCoffeeViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/26/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AddOrEditCoffeeViewController.h"
#import "Coffee.h"
#import "Cupping.h"
#import "DataController.h"
#import "CoffeesViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface AddOrEditCoffeeViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBarButton;

// ScrollView
@property (weak, nonatomic) IBOutlet UIScrollView *addOrEditCoffeeScrollView;
//@property (weak, nonatomic) IBOutlet UIView *mainView;


// MainView
@property (weak, nonatomic) IBOutlet UITextField *nameOrOriginTextField;
@property (weak, nonatomic) IBOutlet UITextField *roasterTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *cuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *roastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewingMethodTextField;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *tastingWheelImageView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UIButton *mainViewSaveButton;

@property (strong, nonatomic) UIActionSheet *addOrChangePhotoActionSheet;

@end

@implementation AddOrEditCoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameOrOriginTextField.delegate = self;
    self.roasterTextField.delegate = self;
    self.locationTextField.delegate = self;
    self.cuppingDateTextField.delegate = self;
    self.roastDateTextField.delegate = self;
    self.brewingMethodTextField.delegate = self;
    self.notesTextView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated {
    
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *newNameOrOriginText = [self.nameOrOriginTextField.text
//                         stringByReplacingCharactersInRange:range withString:string];
//    NSString *newCuppingDateText = [self.cuppingDateTextField.text stringByReplacingCharactersInRange:range withString:string];
//
//    self.saveBarButton.enabled = ([newNameOrOriginText length] > 0 && [newCuppingDateText length] > 1);
//
//    return YES;
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.nameOrOriginTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.nameOrOriginTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.roasterTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.roasterTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.locationTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.locationTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.cuppingDateTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.cuppingDateTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.roastDateTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.roastDateTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.brewingMethodTextField) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.brewingMethodTextField.frame.origin.y - 100) animated:YES];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.notesTextView) {
        [self.addOrEditCoffeeScrollView setContentOffset:CGPointMake(0, self.notesTextView.frame.origin.y - 100) animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addCoffeeExitSegue"])
    {
        // New Coffee Stuff
        Coffee *newCoffee = [Coffee new];
        newCoffee.nameOrOrigin = self.nameOrOriginTextField.text;
        newCoffee.roaster = self.roasterTextField.text;
        newCoffee.cuppings = [NSMutableArray new];
        
        // New Cupping Stuff
        Cupping *newCupping = [Cupping new];
        newCupping.location = self.locationTextField.text;
        newCupping.cuppingDate = self.cuppingDateTextField.text;
        newCupping.roastDate = self.roastDateTextField.text;
        newCupping.brewingMethod = self.brewingMethodTextField.text;
        //        newCupping.cuppingRating = self.addCoffeeRatingView;
        newCupping.image = self.photoImageView.image;
        newCupping.cuppingNotes = self.notesTextView.text;
        [newCoffee.cuppings addObject:newCupping];
        
        [self.dataController.coffees addObject:newCoffee];
        
        [self.dataController save];
        
        CoffeesViewController *coffeesViewController = segue.destinationViewController;
        
        [coffeesViewController.dataController.coffees addObject:newCoffee];
    }
}


-(IBAction)addOrChangePhoto:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.addOrChangePhotoActionSheet = [[UIActionSheet alloc] initWithTitle:@"Photos" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Photo" otherButtonTitles:@"Take Photo",@"Choose Photo", nil];
        
    } else {
        
        self.addOrChangePhotoActionSheet  = [[UIActionSheet alloc] initWithTitle:@"Photos" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Photo" otherButtonTitles:@"Choose Photo", nil];
    }
    [self.addOrChangePhotoActionSheet showInView:self.view];
}

#pragma mark - UIActionSheet Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerControllerSourceType sourceType;
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Take Photo"]) {
        
        sourceType = UIImagePickerControllerSourceTypeCamera;
        
    } else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Choose Photo" ]) {
        
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    } else {
        
        return;
    }
    
    [self showPickerWithSourceType:sourceType];
}

- (void)showPickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = sourceType;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePicker Delegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Completed");
        
        self.photoImageView.image = originalImage;
        
        ALAssetsLibrary *assetsLibrary = [ALAssetsLibrary new];
        if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized || [ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusNotDetermined) {
            [assetsLibrary writeImageToSavedPhotosAlbum:originalImage.CGImage
                                            orientation:ALAssetOrientationUp
                                        completionBlock:^(NSURL *assetURL, NSError *error) {
                                            if (error) {
                                                NSLog(@"Error Saving Image: %@", error.localizedDescription);
                                            }
                                        }];
        } else if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied || [ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusRestricted) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Cannot Save Photo"
                                                                message:@"Authorization status not granted"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
            [alertView show];
            
        } else {
            NSLog(@"Authorization Not Determined");
        }
    }];
}

@end
