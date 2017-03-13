//
//  ViewController.m
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "UserInformation.h"
#import "RequestObject.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"접속 아이디"
                                message:@"아이디를 입력해주세요"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction *action) {
                             NSArray *textfields = alert.textFields;
                             UITextField * idField = textfields[0];
                             [[UserInformation sharedManager] setting:idField.text];
                         }];
    
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"ID";
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name",nil];
    NSDictionary *dic3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic8 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic10 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic11 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic12 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic13 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic14 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    NSDictionary *dic15 = [[NSDictionary alloc] initWithObjectsAndKeys:@"TEST",@"name", nil];
    
    dataList = [[NSArray alloc] initWithObjects:dic1,dic2,dic3,dic4,dic5,dic6,dic7,dic8,dic9,dic10,dic11,dic12,dic13,dic14,dic15,nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dicTemp = [dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = [dicTemp objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:@"image"];
    return cell;
}


- (IBAction)addImage:(id)sender {

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self showImagePicker:sourceType];
}


- (IBAction)imageList:(id)sender {
    [[RequestObject sharedManager] requestImageList];
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:NO];
    [self presentViewController:picker animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIAlertController * imageAlert=   [UIAlertController
                                       alertControllerWithTitle:@"사진제목"
                                       message:@"사진제목을 입력해주세요"
                                       preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"ok"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction *action) {
                             NSArray *textfields = imageAlert.textFields;
                             UITextField *idField = textfields[0];
                             // 싱글톤 이미지 업로드 requset 사용하기.
                         }];
    
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                        [imageAlert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [imageAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"imageName";
    }];
    [imageAlert addAction:cancel];
    [imageAlert addAction:ok];
    [self presentViewController:imageAlert animated:YES completion:nil];
}


@end
