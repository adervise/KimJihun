//
//  ViewController.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"
#import "UserInformation.h"

@interface ViewController ()

@property IBOutlet UILabel *idLabel;
@property IBOutlet UILabel *pwLabel;
@property IBOutlet UILabel *nameLabel;
@property IBOutlet UILabel *ageLabel;
@property IBOutlet UILabel *hobbyLabel;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.ageLabel.text = [[UserInformation sharedUserInfo] age];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[UserInformation sharedUserInfo] setUserId:@"yagom"];
    [[UserInformation sharedUserInfo] setUserPassword:@"1234"];
    
    [[UserInformation sharedUserInfo] addObserver:self
                                forKeyPath:@"userId"
                                options:NSKeyValueObservingOptionNew
                                context:nil];
    
    [[UserInformation sharedUserInfo] addObserver:self
                                forKeyPath:@"userPassword"
                                options:NSKeyValueObservingOptionNew
                                context:nil];
    
    
    [[UserInformation sharedUserInfo] addObserver:self
                                forKeyPath:@"lastName"
                                options:NSKeyValueObservingOptionNew
                                context:nil];
    
    
    [[UserInformation sharedUserInfo] addObserver:self
                                forKeyPath:@"firstName"
                                options:NSKeyValueObservingOptionNew
                                context:nil];
    
    
//    [[UserInformation sharedUserInfo] addObserver:self
//                                       forKeyPath:@"age"
//                                       options:NSKeyValueObservingOptionNew
//                                       context:nil];
//    
    
//    [[UserInformation sharedUserInfo] addObserver:self
//                                       forKeyPath:@"hobby"
//                                       options:NSKeyValueObservingOptionNew
//                                       context:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveHobbyChanged:)
                                    name:DidChangeHobbyValueNotification
                                    object:[UserInformation sharedUserInfo]];
}

- (void)didReceiveHobbyChanged:(NSNotification *)noti {
    
    self.hobbyLabel.text = [[UserInformation sharedUserInfo] hobby];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    self.idLabel.text = [[UserInformation sharedUserInfo] userPassword];
    self.pwLabel.text = [[UserInformation sharedUserInfo] userId];
    self.nameLabel.text = [[UserInformation sharedUserInfo] fullName];
    
}

- (void)dealloc {
    
}


@end
