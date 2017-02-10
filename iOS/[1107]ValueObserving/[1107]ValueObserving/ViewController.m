//
//  ViewController.m
//  [1107]ValueObserving
//
//  Created by celeste on 2016. 11. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self
           forKeyPath:@"count"
           options: NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionPrior |
                    NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
           context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keyPath : %@\ninfoDic : %@", keyPath, change);
    
    if ([keyPath isEqualToString:@"count"]) {
//        NSArray *changeVlaue = change[NSKeyValueChangeNewKey];
        NSInteger changeVlaue = [change[NSKeyValueChangeNewKey] integerValue];
        self.changeLabel.text = [NSString stringWithFormat:@"%ld",changeVlaue];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)countButton:(id)sender {

    UIButton *button = (UIButton *)sender;
    if ([button isKindOfClass:[UIButton class]] == NO) {
        return;
    }
    
    switch (button.tag) {
        case 0:
            self.count++;
            break;
        case 1:
            self.count--;
            break;
        default:
            break;
    }
}


- (void)setCount:(NSInteger)count {
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",_count];
}


- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstNameTextLabel];
}


- (IBAction)nameLog:(id)sender {
    
//    self.fullName = [NSString stringWithFormat:@"%@ %@",self.firstNameTextLabel.text,self.lastNameTextLabel.text];
    
    self.lastName = self.lastName.text;
    self.firstNameTextLabel = self.firstNameTextLabel.text;
    NSLog(@"당신의 이름은 %@입니다.",self.fullName);
}


- (void)dealloc {
    [self removeObserver:self forKeyPath:@"count"];
}

@end
