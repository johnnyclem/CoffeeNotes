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
#import "AppDelegate.h"
#import "CoffeeDatePickerViewController.h"
#import <AXRatingView/AXRatingView.h>



@interface AddOrEditCoffeeViewController () <UIImagePickerControllerDelegate, UIActionSheetDelegate, UITextFieldDelegate, UITextViewDelegate, UIAlertViewDelegate>

// textFields and textViews
@property (weak, nonatomic) IBOutlet UITextField *roasterTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;

@property (weak, nonatomic) IBOutlet UITextField *brewingMethodTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;

// buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBarButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteCoffeeButton;


// views and imageViews
@property (weak, nonatomic) IBOutlet UIScrollView *addOrEditCoffeeScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
//@property (weak, nonatomic) IBOutlet UIImageView *tastingWheelImageView;

// other
@property (strong, nonatomic) UIActionSheet *addOrChangePhotoActionSheet;

@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet AXRatingView *coffeeCuppingRatingView;



@end

@implementation AddOrEditCoffeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.objectContext;
    
    self.nameOrOriginTextField.delegate = self;
    self.roasterTextField.delegate = self;
    self.locationTextField.delegate = self;
    self.brewingMethodTextField.delegate = self;
    self.notesTextView.delegate = self;
    
    if (self.editableCoffee) {
        self.nameOrOriginTextField.text = self.editableCoffee.nameOrOrigin;
        self.roasterTextField.text = self.editableCoffee.roaster;
        self.locationTextField.enabled = NO;
        self.chooseCuppingDateButtonFromCoffee.enabled = NO;
        self.chooseRoastDateButtonFromCoffee.enabled = NO;
        self.brewingMethodTextField.enabled = NO;
        self.notesTextView.editable = NO;
        self.deleteCoffeeButton.enabled = YES;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField and UITextView Methods

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

- (void)textFieldDidChange:(NSNotification *)note
{
    self.saveBarButton.enabled = (self.nameOrOriginTextField.text.length > 0) && (![self.chooseCuppingDateButtonFromCoffee.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
    self.mainViewSaveButton.enabled = (self.nameOrOriginTextField.text.length > 0) && (![self.chooseCuppingDateButtonFromCoffee.titleLabel.text isEqualToString:@"Choose Cupping Date"]);
}

// Button title did change method.

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addCoffeeExitSegue"])
    {
        // New Coffee Stuff
        Coffee *newCoffee = [NSEntityDescription insertNewObjectForEntityForName:@"Coffee" inManagedObjectContext:self.managedObjectContext];
        newCoffee.nameOrOrigin = self.nameOrOriginTextField.text;
        newCoffee.roaster = self.roasterTextField.text;
        
        NSError *error;
        
        [newCoffee.managedObjectContext save:&error];
        
        // New Cupping Stuff
        Cupping *newCupping         = [NSEntityDescription insertNewObjectForEntityForName:@"Cupping" inManagedObjectContext:self.managedObjectContext];
        newCupping.location         = self.locationTextField.text;
        newCupping.cuppingDate      = self.coffeeCuppingDateHolder;
        newCupping.roastDate        = self.coffeeRoastDateHolder;
        newCupping.brewingMethod    = self.brewingMethodTextField.text;
        
        NSNumber *numberFromFloatValue = [[NSNumber alloc]initWithFloat:self.coffeeCuppingRatingView.value];
        newCupping.rating = numberFromFloatValue;
        newCupping.photo = self.photoImageView.image;
        newCupping.cuppingNotes = self.notesTextView.text;
       
        newCupping.coffee = newCoffee;
        
        // Add Save Command!
        
        [newCupping.managedObjectContext save:&error];
        
    } else if ([segue.identifier isEqualToString:@"PickCuppingDateFromCoffee"]) {
        CoffeeDatePickerViewController *destination = segue.destinationViewController;
        destination.segueKey = @"PickCuppingDateFromCoffee";
    } else if ([segue.identifier isEqualToString:@"PickRoastDateFromCoffee"]) {
        CoffeeDatePickerViewController *destination = segue.destinationViewController;
        destination.segueKey = @"PickRoastDateFromCoffee";
    }
}

-(IBAction)CoffeeDatePickerExitSegue:(UIStoryboardSegue *)sender
{
    // Empty method for Exit Segue functionality.
}


#pragma mark - IBActions

-(IBAction)addOrChangePhoto:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.addOrChangePhotoActionSheet = [[UIActionSheet alloc] initWithTitle:@"Photos"
                                                                       delegate:self
                                                              cancelButtonTitle:@"Cancel"
                                                         destructiveButtonTitle:@"Delete Photo"
                                                              otherButtonTitles:@"Take Photo",@"Choose Photo", nil];
        
    } else {
        
        self.addOrChangePhotoActionSheet  = [[UIActionSheet alloc] initWithTitle:@"Photos"
                                                                        delegate:self
                                                               cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete Photo" otherButtonTitles:@"Choose Photo", nil];
    }
    [self.addOrChangePhotoActionSheet showInView:self.view];
}

- (IBAction)deleteCoffeeButtonPressed:(id)sender
    {
        if ([self.deleteCoffeeButton isEnabled]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                message:@"Are you sure you want to delete this coffee and all its cuppings?"
                                                               delegate:self
                                                      cancelButtonTitle:@"Cancel"
                                                      otherButtonTitles:@"Delete", nil];
            
                [alertView show];
    }
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


#pragma mark - UIImagePicker Delegate Methods

- (void)showPickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = sourceType;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


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
        
        [self.editableCoffee.managedObjectContext deleteObject:self.editableCoffee];
        [self performSegueWithIdentifier:@"DeleteCoffeeSegue" sender:self];
    }
}


@end
