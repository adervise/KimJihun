//
//  ImageViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 12..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ImageViewController.h"
#import <UIImageView+WebCache.h>

@interface ImageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

#pragma mark - IBActions
- (IBAction)clickEditButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)tapImageView:(id)sender {
    BOOL isNavibarHidden = self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:!isNavibarHidden animated:YES];
}

#pragma mark - ViewController Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveUploadImageSuccessNotification:)
                                    name:ImageUploadDidSuccessNotification
                                    object:nil];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if (self.imageView.image == nil) {
        NSURL *imageURL = [NSURL URLWithString:self.imageInfo[JSONImageURLKey]];
        [self loadImageFromURL:imageURL];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Image picker controller delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = nil;
    
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   [self showImageTitleAlert:image];
                               }];
}


#pragma mark - Custom Methods

- (void)didReceiveUploadImageSuccessNotification:(NSNotification *)noti {
    NSLog(@"noti info %@",noti.userInfo);
   
    if (noti.userInfo) {
        NSString *imageURLString = noti.userInfo[JSONImageDataKey];

        if ([imageURLString isKindOfClass:[NSString class]]) {
            [self loadImageFromURL:[NSURL URLWithString:imageURLString]];
        }
    }
}


- (void)loadImageFromURL:(NSURL *)imageURL {
    
    id progress = ^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"image downloading... %lf %% ",(double)receivedSize / (double)expectedSize *100);
    };
    
    [self.imageView sd_setImageWithURL:imageURL
                    placeholderImage:nil
                    options:SDWebImageHighPriority | SDWebImageProgressiveDownload | SDWebImageCacheMemoryOnly
                    progress:progress
                    completed:nil];
}

- (void)showImageTitleAlert:(UIImage *)image {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                        message:@"사진제목을 입력해주세요"
                                                        preferredStyle:UIAlertControllerStyleAlert];
    
    id okHandler = ^(UIAlertAction * _Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            alert.textFields.firstObject.text == nil) {
            
            [self showImageTitleAlert:image];
            
        } else {
            NSString *imageTitle = alert.textFields.firstObject.text;
            [RequestObject requestUploadImage:image
                                        title:imageTitle
                                originImageId:self.imageInfo[JSONImageIDKey]];
        }
    };
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                style:UIAlertActionStyleDefault
                                                handler: okHandler];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                style:UIAlertActionStyleCancel
                                                handler:nil];
    
    [alert addAction:cancelAction];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
