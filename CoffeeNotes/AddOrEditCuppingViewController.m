//
//  NewCuppingViewController.m
//  CoffeeNotes
//
//  Created by Cole Bratcher on 4/25/14.
//  Copyright (c) 2014 Cole Bratcher. All rights reserved.
//

#import "AddOrEditCuppingViewController.h"
#import "Cupping.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface AddOrEditCuppingViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *addOrEditCuppingScrollView;

@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *cuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *roastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewingMethodTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

@property (strong, nonatomic) UIActionSheet *addOrChangePhotoActionSheet;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation AddOrEditCuppingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.coffeeNameOrOriginLabel.text = self.currentCoffee.nameOrOrigin;
    self.roasterLabel.text = self.currentCoffee.roaster;
    
    self.locationTextField.delegate = self;
    self.cuppingDateTextField.delegate = self;
    self.roastDateTextField.delegate = self;
    self.brewingMethodTextField.delegate = self;
    self.notesTextView.delegate = self;
    
    if (self.editableCupping) {
        
        self.locationTextField.text = self.editableCupping.location;
        self.cuppingDateTextField.text = self.editableCupping.cuppingDate;
        self.roastDateTextField.text = self.editableCupping.roastDate;
        self.brewingMethodTextField.text = self.editableCupping.brewingMethod;
        self.notesTextView.text = self.editableCupping.cuppingNotes;
        self.deleteCuppingButton.enabled = YES;
}
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.locationTextField) {
        [self.addOrEditCuppingScrollView setContentOffset:CGPointMake(0, self.locationTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.cuppingDateTextField) {
        [self.addOrEditCuppingScrollView setContentOffset:CGPointMake(0, self.cuppingDateTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.roastDateTextField) {
        [self.addOrEditCuppingScrollView setContentOffset:CGPointMake(0, self.roastDateTextField.frame.origin.y - 100) animated:YES];
    } else if (textField == self.brewingMethodTextField) {
        [self.addOrEditCuppingScrollView setContentOffset:CGPointMake(0, self.brewingMethodTextField.frame.origin.y - 100) animated:YES];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.notesTextView) {
        [self.addOrEditCuppingScrollView setContentOffset:CGPointMake(0, self.notesTextView.frame.origin.y - 100) animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addCuppingExitSegue"])
    {
        Cupping *newCupping;
        
        if (self.editableCupping)
        {
            newCupping = self.editableCupping;
        }
        else{
            newCupping = [Cupping new];
        }
        newCupping.location = self.locationTextField.text;
        newCupping.cuppingDate = self.cuppingDateTextField.text;
        newCupping.roastDate = self.roastDateTextField.text;
        newCupping.brewingMethod = self.brewingMethodTextField.text;
        newCupping.cuppingNotes = self.notesTextView.text;
        newCupping.image = self.photoImageView.image;
        
        if (!self.currentCoffee.cuppings) {
            self.currentCoffee.cuppings = [NSMutableArray new];
        }
        
        if (!self.editableCupping) {
            [self.currentCoffee.cuppings addObject:newCupping];
        }
        
        [self.addOrEditCuppingDataController save];
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
