//
//  ViewController.m
//  [1028]MyImagePickerByYagom
//
//  Created by celeste on 2016. 10. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
//    [[self imageView] setImage:image];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(didUserDefalutChange:)
                                        name:NSUserDefaultsDidChangeNotification
                                        object:nil];
    
    
}

- (void)didUserDefalutChange:(NSNotification *)noti {
    NSLog(@"User Default Chenge");
    
    NSData *imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"imageData"];
    UIImage *image = [UIImage imageWithData:imageData];
    [[self imageView] setImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// view 를 눌렀을 때, Alert 뜬 후 클릭하면 다른 메소드에 값 전달
- (IBAction)imagePicker:(UITapGestureRecognizer *)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"사진 가져오기" message:@"사진 가져올 소스 선택" preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak ViewController *weakSelf = self;
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        if ([[action title] isEqualToString:@"사진앨범"]) {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        } else if ([[action title] isEqualToString:@"카메라"]) {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        
        [weakSelf showImagePicker:sourceType];
    };
    
    NSArray *actionTitle = @[@"사진 라이브러리",@"사진앨범",@"카메라",@"취소"];
    
    for (NSString *title in actionTitle) {
        UIAlertActionStyle style = UIAlertActionStyleDefault;
        
        if([title isEqualToString:@"취소"]){
            style = UIAlertActionStyleCancel;
        } else if ([title isEqualToString:@"카메라"]) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
                continue;
            }
            style = UIAlertActionStyleDestructive;
        }
    
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:actionHandler];
        [actionSheet addAction:action];
    }
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}


// 이미지를 선택하는 부분까지 처리
- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:YES];
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark - UIImagePickerController Delegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 이미지를 선택하여 imageView 에 view 시키는부분
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    
    if (pickedImage == nil) {
        pickedImage = info[UIImagePickerControllerOriginalImage];
    }
    
    if (pickedImage == nil) {
        NSLog(@"사진이 없습니다");
        return;
    }
    
    NSData *imageData = UIImageJPEGRepresentation(pickedImage, 1.0);
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:imageData forKey:@"imageData"];
    [userDefault synchronize];
    
    [[self imageView] setImage:pickedImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
