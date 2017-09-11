//
//  ViewController2.m
//  [1107]ValueObserving
//
//  Created by celeste on 2016. 11. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController2.h"
#import "DataCenter.h"

@interface ViewController2 ()
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *loadedData = [self loadList];
    
    if (loadedData) {
        self.dataList = [[NSMutableArray alloc] initWithArray:loadedData];
        
    }else {
        self.dataList = [[NSMutableArray alloc] init];
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButton:(id)sender {
    
    [[DataCenter sharedManager] saveProfile:self.gender.text name:self.name.text age:self.age.text  hobby:self.hobby.text];
}



- (NSArray *)loadList {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingString:@"ProfileList.plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *nameList = [dic objectForKey:@"Root"];
    
    return nameList;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    return YES;
}

@end
