//
//  ViewController.m
//  [1114]NSURLSessionExample
//
//  Created by celeste on 2016. 11. 14..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *ready;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ViewController __weak *wself = self;
    [wself.ready startAnimating];
    NSURL *thumbnailURL = [NSURL URLWithString:@"https://tv.pstatic.net/thm?size=f202x152&quality=9&q=http://imgauto.naver.com/20160427_256/auto_1461737285114Nr7HR_JPEG/20160427150750_RplTLaao.jpg"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionTask *task = [session dataTaskWithURL:thumbnailURL
                                 completionHandler:^(NSData * _Nullable data,
                                            NSURLResponse * _Nullable response,
                                                 NSError * _Nullable error) {
                                     
                                        if (data) {
                                            UIImage *image = [UIImage imageWithData:data];
                                            if (image) {
                                                dispatch_sync(dispatch_get_main_queue(), ^{
                                                    self.imageView.image = image;
                                                    [wself.ready stopAnimating];
                                                });
                                            }
                                        }
                                    }];
    [task resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
