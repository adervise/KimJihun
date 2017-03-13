//
//  ViewController.m
//  [1027]MyImagePicker
//
//  Created by celeste on 2016. 10. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

static NSString * const actionNameCamera = @"카메라";
static NSString * const actionNamePhotolibrary = @"라이브러리";

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"myImage"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[self imgView] setImage:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickView:(UITapGestureRecognizer *)sender {
    NSLog(@"test");
    [self showAlertController:UIAlertControllerStyleActionSheet];
}


- (void)showAlertController:(UIAlertControllerStyle)style {
    
    // UIAlertAction 상태를 받아서 imagePicker Source Type 불러오기.
    void (^handlerBlock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        [imagePickerController setDelegate:self];
        [imagePickerController setAllowsEditing:NO];
        
        if ([[action title]isEqualToString:@"photo"]) {
            [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        } else if ([[action title]isEqualToString:actionNamePhotolibrary]) {
            [imagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        } else if ([[action title]isEqualToString:@"album"]) {
            [imagePickerController setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        } else if ([[action title]isEqualToString:@"cancel"]) {
            return;
        } else {
            NSLog(@"Failed");
        }
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    };
    
    // Alert 생성 및 Action Add 하는 부분
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"사진라이브러리"
                                          message:@"사진 소스를 선택해주세요"
                                          preferredStyle:style];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:handlerBlock];
    
    [alertController addAction:cancelAction];
    
    UIAlertAction *photoAction = [UIAlertAction
                                  actionWithTitle:@"사진"
                                  style:UIAlertActionStyleDefault
                                  handler:handlerBlock];
    
    [alertController addAction:photoAction];
    
    UIAlertAction *libraryAction = [UIAlertAction
                                    actionWithTitle:actionNamePhotolibrary
                                    style:UIAlertActionStyleDefault
                                    handler:handlerBlock];
    
    [alertController addAction:libraryAction];
    
    UIAlertAction *albumAction = [UIAlertAction
                                  actionWithTitle:@"album"
                                  style:UIAlertActionStyleDefault
                                  handler:handlerBlock];
    
    [alertController addAction:albumAction];

    [self presentViewController:alertController animated:YES completion:^{NSLog(@"completiomBlockCode Test");}];
}

// 이미지를 imageView 에 출력해주는 Delegate -> 츨력 후 알림창
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *rectImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.imgView setImage:rectImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"이미지를 성공적으로 가져왔어요"
                                message:@""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:nil];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:UIImagePNGRepresentation(rectImage) forKey:@"myImage"];
    [defaults synchronize];
}


@end
