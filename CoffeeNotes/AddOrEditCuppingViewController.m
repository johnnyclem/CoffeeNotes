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
#import <AXRatingView/AXRatingView.h>


@interface AddOrEditCuppingViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate, UITextViewDelegate, UINavigationControllerDelegate>

// labels
@property (weak, nonatomic) IBOutlet UILabel *coffeeNameOrOriginLabel;
@property (weak, nonatomic) IBOutlet UILabel *roasterLabel;

// text fields
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *cuppingDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *roastDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *brewingMethodTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *mainViewSaveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarSaveButton;

// views and image views
@property (weak, nonatomic) IBOutlet UIScrollView *addOrEditCuppingScrollView;
@property (weak, nonatomic) IBOutlet AXRatingView *cuppingRatingView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

// other
@property (strong, nonatomic) UIActionSheet *addOrChangePhotoActionSheet;

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
        self.cuppingRatingView.value = self.editableCupping.cuppingRating.floatValue;
        self.deleteCuppingButton.enabled = YES;
        
    }
    
    self.navigationBarSaveButton.enabled = self.cuppingDateTextField.text.length > 0;
    self.mainViewSaveButton.enabled = self.cuppingDateTextField.text.length > 0;

    
    [self.cuppingRatingView sizeToFit];
    [self.cuppingRatingView setStepInterval:0.5];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActions

- (IBAction)ratingChanged:(AXRatingView *)sender
{
    NSLog(@"Changed Rating to %.0f", sender.value);
}

-(IBAction)addOrChangePhotoButtonPressed:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.addOrChangePhotoActionSheet = [[UIActionSheet alloc] initWithTitle:@"Photos" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Photo" otherButtonTitles:@"Take Photo",@"Choose Photo", nil];
        
    } else {
        
        self.addOrChangePhotoActionSheet  = [[UIActionSheet alloc] initWithTitle:@"Photos" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Photo" otherButtonTitles:@"Choose Photo", nil];
    }
    [self.addOrChangePhotoActionSheet showInView:self.view];
}

- (IBAction)deleteCuppingButtonPressed:(id)sender
{
    if ([self.deleteCuppingButton isEnabled]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                           message:@"Are you sure you want to delete this cupping?"
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                                 otherButtonTitles:@"Delete", nil];
        [alertView show];
    }
}

#pragma mark - Segues

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
        
        NSNumber *numberFromFloatValue = [[NSNumber alloc]initWithFloat:self.cuppingRatingView.value];
        newCupping.cuppingRating = numberFromFloatValue;
        
        
        if (!self.currentCoffee.cuppings) {
            self.currentCoffee.cuppings = [NSMutableArray new];
        }
        
        if (!self.editableCupping) {
            [self.currentCoffee.cuppings addObject:newCupping];
        }
        
        [self.addOrEditCuppingDataController save];
    }
}

#pragma mark - UITextField and UITextView Methods (Delegate and non-delegate)

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

- (void)textFieldDidChange:(NSNotification *)note
{
    self.navigationBarSaveButton.enabled = self.cuppingDateTextField.text.length > 0;
    self.mainViewSaveButton.enabled = self.cuppingDateTextField.text.length > 0;
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

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Delete"]) {
        [self.currentCoffee.cuppings removeObject:self.editableCupping];
        [self performSegueWithIdentifier:@"deleteCupping" sender:self];
    }
}

@end
