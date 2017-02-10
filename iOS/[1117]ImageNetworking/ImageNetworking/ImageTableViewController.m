//
//  ImageTableViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ImageTableViewController.h"
#import "ImageViewController.h"

@interface ImageTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, readonly) NSArray *imageInfos;

@end

@implementation ImageTableViewController

#pragma mark - Properties

- (NSArray *)imageInfos {
    return [[UserInformation sharedUserInfo] imageInfoJSONArray];
}

#pragma mark - ViewController Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(reloadTableViewData)
                                    name:ImageListUpdatedNotification
                                    object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:[RequestObject class]
                                    selector:@selector(requestImageList)
                                    name:ImageUploadDidSuccessNotification
                                    object:nil];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor redColor];
    [self.refreshControl addTarget:[RequestObject class]
                      action:@selector(requestImageList)
                      forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([[UserInformation sharedUserInfo] userId] == nil) {
        [self showUserIdAlert];
    }
}

#pragma mark - Custom Methods

- (void)reloadTableViewData {
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)showUserIdAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"유저 ID 입력"
                                message:@"유저 ID를 입력해주세요"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    id actionHandler = ^(UIAlertAction * _Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text containsString:@" "] ||
            [alert.textFields.firstObject.text integerValue] == 0) {
            [self showUserIdAlert];
        } else {
            [[UserInformation sharedUserInfo] setUserId:alert.textFields.firstObject.text];
            self.navigationItem.title = alert.textFields.firstObject.text;
            [RequestObject requestImageList];
        }
    };
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"확인"
                               style:UIAlertActionStyleDefault
                               handler: actionHandler];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"100~150 사이의 숫자";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showImageTitleAlert:(UIImage *)image {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"사진제목"
                                message:@"사진제목을 입력해주세요"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    id okHandler = ^(UIAlertAction * _Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            alert.textFields.firstObject.text == nil) {
            
            [self showImageTitleAlert:image];
            
        } else {
            NSString *imageTitle = alert.textFields.firstObject.text;
            [RequestObject requestUploadImage:image title:imageTitle originImageId:nil];
        }
    };
    
    UIAlertAction *okAction = [UIAlertAction
                                actionWithTitle:@"확인"
                                style:UIAlertActionStyleDefault
                                handler: okHandler];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"취소"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    
    [alert addAction:cancelAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - IBActions

- (IBAction)clickUploadImageButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)clickRefeshImageListButton:(id)sender {
    [RequestObject requestImageList];
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"
                                                            forIndexPath:indexPath];
    
    NSDictionary *imageInfo = [self.imageInfos objectAtIndex:indexPath.row];
    NSString *title = [imageInfo objectForKey:JSONTitleKey];
    NSString *thumbnailURLString = [imageInfo objectForKey:JSONTumbnailURLKey];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    id imageHandler = ^(NSData * _Nullable data,
                        NSURLResponse * _Nullable response,
                        NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                    cellForUpdate.imageView.image = image;
                });
            }
        }
    };
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL
                                                    completionHandler:imageHandler];
    
    [task resume];
    [[cell textLabel] setText:title];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        NSDictionary *imageInfo = self.imageInfos[indexPath.row];
        [RequestObject requestDeleteImage:imageInfo[JSONImageIDKey]];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *cell = sender;
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    NSDictionary *imageInfo = self.imageInfos[cellIndex.row];
    ImageViewController *nextViewController = segue.destinationViewController;
    nextViewController.imageInfo = imageInfo;
}



@end
