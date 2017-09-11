//
//  ImageTableViewController.m
//  [1116]NetworkingMiniProjectSecond
//
//  Created by celeste on 2016. 11. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ImageTableViewController.h"

@interface ImageTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ImageTableViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([[[UserInformation sharedUserInfo] userId] isEqualToString:self.navigationItem.title] == NO) {
        [self showUserIdAlert];
    }
}


- (void)showUserIdAlert {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"유저 ID 입력"
                                message:@"유저 ID를 입력하세요"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    id actionHandler = ^(UIAlertAction *_Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text containsString:@" "] ||
            [alert.textFields.firstObject.text integerValue] == 0) {
            [self showUserIdAlert];
        } else {
            [[UserInformation sharedUserInfo] setUserId:alert.textFields.firstObject.text];
            self.navigationItem.title = alert.textFields.firstObject.text;
            [RequestObject requsetImageList];
        }
    };

    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"확인"
                               style:UIAlertActionStyleDefault
                               handler:actionHandler];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"100 ~ 150 사이의 숫자";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
    [super viewDidAppear:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView
                                    selector:@selector(reloadData)
                                    name:ImageListUpdatedNotification
                                    object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)clickRefreshButton:(id)sender {
    [RequestObject requsetImageList];
}

// 이미지 피커를 보여주기
- (IBAction)clickAddButton:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    UIImage *image = nil;
    
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        // 위 함수의 축약형
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"사진 이름 입력"
                                message:@"사진 이름을 입력하세요"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    id okHandler = ^(UIAlertAction *_Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0) {
        } else {
            NSString *imageTitle = alert.textFields.firstObject.text;
            NSLog(@"사진의 이름 : %@ 입니다.", imageTitle);
            [RequestObject requsetUploadImage:image title:imageTitle];
        }
    };
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"확인"
                               style:UIAlertActionStyleDefault
                               handler:okHandler];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"취소"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진 제목";
    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [picker dismissViewControllerAnimated:YES completion:^{
                [self presentViewController:alert animated:YES completion:nil];
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[[UserInformation sharedUserInfo] imageInfoList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    NSDictionary *imageInfoDic = [[[UserInformation sharedUserInfo] imageInfoList] objectAtIndex:indexPath.row];
    NSString *imageTitle = [imageInfoDic objectForKey:@"title"];
    NSString *thumbnailURLString = [imageInfoDic objectForKey:@"thumbnail_url"];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    id imageTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            // cell.imageView.image = image; 이렇게 할 경우 엄청많은 이미지를 불러올 경우 문제가 된다.
            UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
            cellForUpdate.imageView.image = image;
        });
    };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:thumbnailURL completionHandler:imageTaskHandler];
    [dataTask resume];
    
    [[cell textLabel] setText:imageTitle];
    
/*
     이와 같은 방법은 인터넷 URL이 아닌 로컬파일 URL이 있을 때 사용한다.
     NSData *imageData = [NSData dataWithContentsOfURL:thumbnailURL];
     UIImage *image = [UIImage imageWithData:imageData];
     [[cell imageView] setImage:image];
     [[cell textLabel] setText:imageTitle];
*/
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
        // request Delete 만들기 서버에게 지워달라고 요청
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
