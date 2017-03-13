//
//  ViewController.m
//  ValueObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSInteger count;
@property IBOutlet UILabel *countLabel;

@property IBOutlet UITextField *lastNameField;
@property IBOutlet UITextField *firstNameField;

@property NSString *lastName;   // 성
@property NSString *firstName;  // 이름
@property (readonly) NSString *fullName;   // 전체이름

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self
           forKeyPath:@"count"
           options:NSKeyValueObservingOptionNew
           context:nil];
    
    [self addObserver:self
           forKeyPath:@"lastName"
           options:NSKeyValueObservingOptionNew
           context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath : %@\ninfoDic : %@", keyPath, change);
    
    if ([keyPath isEqualToString:@"count"]) {
        NSInteger changedValue = [change[NSKeyValueChangeNewKey] integerValue];
        self.countLabel.text = [NSString stringWithFormat:@"%ld", changedValue];
    } else if ([keyPath isEqualToString:@"lastName"]) {
        // Empty Line
    }
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@%@", _lastName, _firstName];
}

- (IBAction)clickNameButton:(id)sender {
    self.lastName = self.lastNameField.text;
    self.firstName = self.firstNameField.text;
    NSLog(@"%@", self.fullName);
}

- (IBAction)clickButton:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    if ([button isKindOfClass:[UIButton class]] == NO) {
        return;
    }
    
    switch (button.tag) {
        case 1:
            self.count++;
            break;
        case 2:
            self.count--;
            break;
        default:
            break;
    }
    
}

//- (void)setCount:(NSInteger)count {
//    _count = count;
//    
//    self.countLabel.text = [NSString stringWithFormat:@"%ld", _count];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"count"];
    [self removeObserver:self forKeyPath:@"lastName"];
}


@end




















