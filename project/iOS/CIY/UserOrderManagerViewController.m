
//  UserOrderManagerViewController.m
//  TableViewTreeDemo
//
//  Created by admin on 16/10/14.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "UserOrderManagerViewController.h"
#import "UserOrderManageCollectionViewCell.h"
#import "UserOrderManageTableViewCell.h"
#import "UserOrderProductTableViewCell.h"
#import "UserOrderPayTableViewCell.h"
#import "UserNotiTableViewCell.h"
#import "WSTableviewTree.h"
#import <AFNetworking.h>


typedef enum : NSUInteger {
    UserOrderTypeAll = 0,
    UserOrderTypeUnpaid,
    UserOrderTypePaid,
    UserOrderTypeShipped,
    UserOrderTypeComplete
} UserOrderType;


@interface UserOrderManagerViewController () <UICollectionViewDelegate, UICollectionViewDataSource, WSTableViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet WSTableView *tableView;
@property (copy, nonatomic) NSArray *titleArrays;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (nonatomic, strong) NSMutableArray *dataSourceArrM;
// 0:새소식 1:자동차 2:매거진
@property NSInteger itemFlag;
// 0:Default 2:전체읽음
@property NSInteger readFlag;
@property NSArray *dataTest;
@property NSMutableArray *timelineData;

@end

@implementation UserOrderManagerViewController

#pragma mark - Private


// 초기 Flag 값 및 네이게이션바, cellXIB, button, data 설정
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.readFlag = 0;
    self.itemFlag = 1;
    self.title = @"카이즈유 소식";
    self.navigationController.navigationBar.hidden = NO;
    
    [self registerCell];
    [self requestCarDataList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private

- (UserOrderType)getOrderTypeWithTitle:(NSString *)title {
    
    if ([title isEqualToString:@"새소식"]) {
        return UserOrderTypeAll; //0
    } else if ([title isEqualToString:@"자동차"]) {
        return UserOrderTypeUnpaid; //1
    } else if ([title isEqualToString:@"매거진"]) {
        return UserOrderTypePaid; //2
    }
    return UserOrderTypeAll;
}

// 버튼 등록하기
- (void)addRightBarButtonItem {
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"모두읽음"
                                                                        style:UIBarButtonItemStyleDone
                                                                       target:self
                                                                       action:@selector(close)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

// 셀 등록하기
- (void)registerCell {
    
    UINib *nibName = [UINib nibWithNibName:NSStringFromClass([UserOrderManageCollectionViewCell class]) bundle:nil];
    [self.collectionView registerNib:nibName forCellWithReuseIdentifier:NSStringFromClass([UserOrderManageCollectionViewCell class])];
    self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    UINib *orderManagerNib = [UINib nibWithNibName:NSStringFromClass([UserOrderManageTableViewCell class]) bundle:nil];
    [self.tableView registerNib:orderManagerNib forCellReuseIdentifier:NSStringFromClass([UserOrderManageTableViewCell class])];
    
    UINib *orderProductNib = [UINib nibWithNibName:NSStringFromClass([UserOrderProductTableViewCell class]) bundle:nil];
    [self.tableView registerNib:orderProductNib forCellReuseIdentifier:NSStringFromClass([UserOrderProductTableViewCell class])];
    
    UINib *orderPayNib = [UINib nibWithNibName:NSStringFromClass([UserOrderPayTableViewCell class]) bundle:nil];
    [self.tableView registerNib:orderPayNib forCellReuseIdentifier:NSStringFromClass([UserOrderPayTableViewCell class])];
    
    UINib *notiNib = [UINib nibWithNibName:NSStringFromClass([UserNotiTableViewCell class]) bundle:nil];
    [self.tableView registerNib:notiNib forCellReuseIdentifier:NSStringFromClass([UserNotiTableViewCell class])];
}


// Data불러온 후 그리기
- (void)DataGetApi {


    
    NSMutableArray *timelineData = [NSMutableArray array];
    NSMutableArray *gData = [NSMutableArray array];
    NSString *prevDate = @"";
    NSInteger i,z;
    NSInteger sectionTags = 0;
    
    for (i = 0, z = [self.dataTest count]; i < z; i++) {
        
        NSMutableDictionary *sdata = [self.dataTest objectAtIndex:i];
        NSMutableDictionary *dic0 = [NSMutableDictionary dictionary];
        NSString *date = [sdata objectForKey:@"date"];
        if (![prevDate isEqualToString:date]) {
            if ([gData count] > 1) {

                [timelineData addObject:[[NSMutableArray alloc] initWithArray:gData copyItems:YES]];
                [gData removeAllObjects];
            }

            [dic0 setObject:date forKey:@"date"];
            [gData addObject:dic0];
            prevDate = date;
            sectionTags = i;
        }

        NSMutableDictionary *cData = [NSMutableDictionary dictionary];
        [cData setObject:[sdata objectForKey:@"subject"] forKey:@"subject"];
        [cData setObject:[sdata objectForKey:@"link"] forKey:@"link"];
        [gData addObject:cData];
    }
    
    if ([gData count] > 1) {
        [timelineData addObject:gData];
    }

    
    _dataSourceArrM = nil;
    self.tableView.WSTableViewDelegate = self;
    _dataSourceArrM = [NSMutableArray array];
    
    int line = 0;
    
    for (NSInteger j=0; j <[timelineData count]; j++) {
        
        if (j == 0) {
            line = 0;
        } else {
            line = line+1;
        }
        
        NSMutableDictionary *check = [timelineData objectAtIndex:j];
        WSTableviewDataModel *j = [[WSTableviewDataModel alloc] init];

        for(NSDictionary *t in check){
            
            NSString *subject = [t valueForKey:@"subject"];
            NSString *link = [t valueForKey:@"link"];
            NSString *date = [t valueForKey:@"date"];
            
            if (date != nil) {
                
                if (line == 0) {
                    
                    NSDateFormatter *today = [[NSDateFormatter alloc] init];
                    [today setDateFormat:@"yyyy-MM-dd"];
                    NSString *todayDate = [today stringFromDate:[NSDate date]];
                    
                    NSLog(@"%@ vs %@",date,todayDate);
                    // 날짜가 같으면 Today 다르면 그냥 최근 날짜
                    if ([date isEqualToString:todayDate]) {
                        j.firstLevelStr = @"Today";
                        j.shouldExpandSubRows = YES;
                    } else {
                        j.firstLevelStr = date;
                        j.shouldExpandSubRows = YES;
                    }
                    
                } else if (line>0 && line<6) {
                    j.firstLevelStr = date;
                    j.shouldExpandSubRows = YES;
                } else {
                    j.firstLevelStr = date;
                    j.shouldExpandSubRows = NO;
                }
                
            } else {
                [j object_add_toSecondLevelArrM2:subject withURL:link];
            }
        }
        
        [_dataSourceArrM addObject:j];
    }
    
}


#pragma mark - Getters & Setters

// section 데이터 호출하기
- (NSArray *)titleArrays {
    
    if (!_titleArrays) {
        _titleArrays = @[@"자동차", @"매거진"];
    }
    return _titleArrays;
}

#pragma mark - UICollectionViewDataSource

// 콜렉션뷰 상단. titleArrays 등록 개수 많큼 분할 해주는 부분
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArrays.count;
}

// 콜렉션뷰 상단. titleArrays 제목 등록 해주는 부분
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UserOrderManageCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserOrderManageCollectionViewCell class])
                                              forIndexPath:indexPath];
    NSString *title = self.titleArrays[indexPath.item];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",title];
    cell.lineView.hidden = ![self.selectedIndexPath isEqual:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

// 콜렉션뷰 상단. titleArrays 제목 밑줄 그리기
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(floorf([UIScreen mainScreen].bounds.size.width / self.titleArrays.count) - 1, 45);
}

// 콜렉션뷰 상단. titleArrays 제목 등록 선택 시 로그 어느 부분 찍었는지 로그 찍어주는 부분
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    self.selectedIndexPath = indexPath;
    NSString *title = self.titleArrays[indexPath.item];
//    UserOrderType type = [self getOrderTypeWithTitle:title];
//    NSLog(@"😎 type : %ld, title : %@ 😎",type, title);
    [collectionView reloadData];
    
    if ([title isEqualToString:@"새소식"]) {
        
        self.itemFlag = 0;
        [self requestCarDataList];
//        [self notiData];
        self.navigationItem.rightBarButtonItem = nil;
//        [self.navigationItem.rightBarButtonItem setEnabled:YES];
//        [self addRightBarButtonItem];
        
    } else if ([title isEqualToString:@"자동차"]) {

        self.itemFlag = 1;
        [self requestCarDataList];
        [self DataGetApi];
        self.navigationItem.rightBarButtonItem = nil;
        
    } else if ([title isEqualToString:@"매거진"]) {
        
        self.itemFlag = 2;
        [self requestCarDataList];
        [self DataGetApi];
        self.navigationItem.rightBarButtonItem = nil;
    }
}


#pragma mark - UITableViewDataSource & UITableViewDelegate

// 섹션 헤더의 높이 알림 일때1, 타임라인일때 10
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section == 0) {
        return 10;
    }
    
    if (self.itemFlag == 0) {
        return 1.0f;
    } else {
        return 10.0f;
    }
}

// 섹션의 개수 카운트해서 그리는 부분, 데이터 최대값 까지만.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataSourceArrM count];
}

// 색션을 몇개 반복해서 출력할 것인지
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// 색션 + 해당로우의 개수 카운트 해서 그리기 그래서 +1이 붙음, 색션까지 그려야 하니까
- (NSInteger)tableView:(WSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath {

    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    return [dataModel.secondLevelArrM count] + 1;
}

// 트리뷰 사용할 것인지에 대한 색션 별 0,1 갑 체크
- (BOOL)tableView:(WSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath {
    
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    return dataModel.shouldExpandSubRows;
}

// Cell Row 그리기 알림일 때 Flag = 0, 타임라인일 때 Flag = 1
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    
    if (self.itemFlag == 0) {
        
        UserNotiTableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserNotiTableViewCell class])];
        cell.notiTitleLabel.text = dataModel.firstLevelStr;
        cell.notiDateLabel.text = dataModel.notiDate;
        cell.expandable = dataModel.expandable;

        
        if (dataModel.readCheck == NO) {
            NSLog(@"🏏🏏readCheck:%d ,readFlag:%ld,  🏏🏏",dataModel.readCheck,self.readFlag);
            cell.backgroundColor = [UIColor whiteColor];
            
            if (self.readFlag == 1) {
                dataModel.readCheck = YES;
                [self.navigationItem.rightBarButtonItem setEnabled:NO];
                cell.backgroundColor = [UIColor whiteColor];
            }
            
        } else {
            NSLog(@"🏏🏏🏏🏏readCheck : %d ,readFlag : %ld 🏏🏏🏏🏏",dataModel.readCheck,self.readFlag);
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        return cell;

    } else {

        UserOrderManageTableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserOrderManageTableViewCell class])];
        cell.statusLabel.text = dataModel.firstLevelStr;
        cell.expandable = dataModel.expandable;
        cell.shouldExpandSubRows = YES;
        return cell;
    }
}

// Cell SubRow 그리기
- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath {

    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    
        if (indexPath.subRow < dataModel.secondLevelArrM.count) {
            
            UserOrderProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserOrderProductTableViewCell class])];
            cell.productNamelabel.text = [dataModel object_get_fromSecondLevelArrMWithIndex:indexPath.subRow];
            cell.bottomHeightConstraint.constant = indexPath.subRow == dataModel.secondLevelArrM.count - 1 ? 0.0f : 5.0f;
            return cell;
        }
    
        UserOrderPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserOrderPayTableViewCell class])];
        return cell;
}

// Cell Row height 값 알림일 때 75, 타임라인 일 때 50
- (CGFloat)tableView:(WSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.itemFlag == 0) {
        return 75.0f;
    } else {
        return 50.0f;
    }
}

// Cell SubRow height 값
- (CGFloat)tableView:(WSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath {

    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    if (indexPath.subRow < dataModel.secondLevelArrM.count) {
        if (indexPath.subRow == dataModel.secondLevelArrM.count - 1) {
            return 85.0f/2;
        }
        return 90.0f/2;
    } else {
        return 1.0f/2;
    }
}

// Row Select 값, additionalDevelopment : 클릭시 해당 셀의 클릭 넌클릭 키값 읽음으로 넘겨주기.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    dataModel.shouldExpandSubRows = !dataModel.shouldExpandSubRows;
    NSLog(@"Section: %ld, Row:%ld, Title:%@, URL:%@, TAG:%ld, SectionTag:%ld", indexPath.section, indexPath.row, dataModel.firstLevelStr, dataModel.urlStr, dataModel.tag, dataModel.sectionTag);
}

// additionalDevelopment: 노티센터로 URL 저장한다음 pop -> webview reload로 넘어가기.
- (void)tableView:(WSTableView *)tableView didSelectSubRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    NSDictionary *item = [dataModel.secondLevelArrM objectAtIndex:indexPath.subRow];
    NSString *url = [item objectForKey:@"link"];
    NSString *title = [item objectForKey:@"secondLevelObj"];
    NSLog(@"Section: %ld, Row:%ld, Subrow:%ld, Title:%@, URL:%@, TAG:%ld, SectionTag:%ld", indexPath.section, indexPath.row, indexPath.subRow, title, url, dataModel.tag, dataModel.sectionTag);
    
    NSString *URL = url;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:URL forKey:@"pageURL"];
    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
    [noti postNotificationName:@"saverURL" object:self userInfo:dic];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - handlers

- (void)close {
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
    self.readFlag = 1;
    [self.tableView collapseCurrentlyExpandedIndexPaths];
}


// AF json 데이터 가지고 오기.
- (void)requestCarDataList {
    
    NSString *url;
    
    if (self.itemFlag == 0) {
        url = @"http://m.carisyou.com/api/alarm";
    } else if (self.itemFlag == 1) {
        url = @"http://m.carisyou.com/api/car";
    } else if (self.itemFlag == 2) {
        url = @"http://m.carisyou.com/api/magazine";
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"🎾 Error: %@ 🎾", error);
        } else {
            NSLog(@"🎾 response:%@", response);
//            NSLog(@"🎾 Finish , responseObject:%@ 🎾",responseObject);
            self.dataTest = responseObject;
            [self DataGetApi];
            [self.tableView reloadData];
            [self.tableView refreshData];
        }
    }];
    [dataTask resume];
}


@end
