//
//  ViewController.m
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "SVSlidingPanelViewController.h"



@interface SVSlidingPanelViewController ()

//MARK: - Private properties
@property (nonatomic) UIView *leftPanelContainerView;
@property (nonatomic) UIView *centerPanelContainerView;

//@property (nonatomic) UIView *rightPanelContainerView;
@property (nonatomic) UIView *tapView;//제스쳐를 받는 뷰ㅎ

//@property (nonatomic) CGPoint locationBeforePan;

//Centerpannel의 Frame을 가지고 있는 변수
@property (nonatomic) CGRect centerPanelRestingFrame;

//현재 상태
@property (nonatomic) SVSlidingPanelState slidingPanelState;

@end


@implementation SVSlidingPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    
    CGRect leftPanelFrame = self.view.bounds;
    leftPanelFrame.size.width = [self leftSlidingPanelVisibleWidth];
    
    self.leftPanelContainerView.frame = leftPanelFrame;
    self.leftPanelContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.leftPanel.view.frame = self.leftPanelContainerView.frame;
    
    self.centerPanelContainerView.frame = self.view.bounds;
    self.centerPanelContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.centerPanel.view.frame = self.centerPanelContainerView.frame;
    
//    CGRect rightPanelFrame = self.view.bounds;
//    rightPanelFrame.size.width = [self rightSlidingPanelVisibleWidth];
//    self.rightPanelContainerView = [[UIView alloc] initWithFrame:rightPanelFrame];
//    self.rightPanelContainerView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    self.rightPanel.view.frame = self.rightPanelContainerView.frame;
    
    [self.view addSubview:self.leftPanelContainerView];
    [self.view addSubview:self.centerPanelContainerView];
//    [self.view addSubview:self.rightPanelContainerView];
    
    [self hamburgurButtonForLeftPanel];
//    [self hamburgurButtonForRightPanel];
    
    // addSubView 된 것을 앞으로 보내면서  하는 메소드
    self.slidingPanelState = CenterVisible;
    [self.view bringSubviewToFront:self.centerPanelContainerView];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self layoutPanelContainer];
    [self styleForContainerView:self.centerPanelContainerView animationOption:NO];
}

- (void)setUp {

//    _shouldPanEnabledSliding = YES;
//    _shouldPanningLimitedToTopViewController = YES;
//    _shouldAllowLeftOverPanning = YES;
//    _shouldAllowRightOverPanning = YES;
//    _shouldTapEnabledSliding = YES;
//    _shouldAutoRotationEnabled = YES;
    
    _shouldAnimateSidePanel = NO;
    _shouldBounceEnableSliding = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Property Setter
- (void)setLeftPanel:(UIViewController *)leftPanel {
    
    _leftPanel = leftPanel;
    if (self.leftPanelContainerView == nil) {
        self.leftPanelContainerView = [[UIView alloc] init];
    }
    
    [leftPanel willMoveToParentViewController:nil];
    [leftPanel.view removeFromSuperview];
    [leftPanel removeFromParentViewController];
    
    leftPanel.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
    [self addChildViewController:leftPanel];
    [self.leftPanelContainerView addSubview:leftPanel.view];
    
    [leftPanel didMoveToParentViewController:self];
    
    
}

//#pragma mark - Center panel holding the controller to show
- (void)setCenterPanel:(UIViewController *)centerPanel {
    
    _centerPanel = centerPanel;
    if (self.centerPanelContainerView == nil) {
        self.centerPanelContainerView = [[UIView alloc] init];
    }
    
    [centerPanel willMoveToParentViewController:nil];
    [centerPanel.view removeFromSuperview];
    [centerPanel removeFromParentViewController];
    
    
    centerPanel.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
    [self addChildViewController:centerPanel];
    [self.centerPanelContainerView addSubview:centerPanel.view];
    
    [centerPanel didMoveToParentViewController:self];
    
//    if (self.shouldPanEnabledSliding) {
//        [self addPanGestureToView:self.centerPanel.view];
//    }
}

//#pragma mark - Right panel holding the controller to show
//- (void)setRightPanel:(UIViewController *)rightPanel
//{
//    [rightPanel willMoveToParentViewController:nil];
//    [rightPanel.view removeFromSuperview];
//    [rightPanel removeFromParentViewController];
//    
//    rightPanel.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
//    [self addChildViewController:rightPanel];
//    
//    [self.rightPanelContainerView addSubview:rightPanel.view];
//    [rightPanel didMoveToParentViewController:self];
//    _rightPanel = rightPanel;
//}

- (void)setSlidingPanelState:(SVSlidingPanelState)slidingPanelState {
    
    _slidingPanelState = slidingPanelState;
    switch (slidingPanelState) {
        case LeftVisible:
            self.visibleController = self.leftPanel;
            self.leftPanelContainerView.userInteractionEnabled = YES;
            break;
        case CenterVisible:
            self.visibleController = self.centerPanel;
            self.leftPanelContainerView.userInteractionEnabled = NO;
//            self.rightPanelContainerView.userInteractionEnabled = NO;
            break;
        case RightVisible:
//            self.visibleController = self.rightPanel;
//            self.rightPanelContainerView.userInteractionEnabled = YES;
            break;
        default:
            break;
    }
}

#pragma mark - Container Layout Methods

- (CGFloat)leftSlidingPanelVisibleWidth {
    return self.view.bounds.size.width * leftPanelVisibleWidth;
}

- (CGFloat)rightSlidingPanelVisibleWidth {
    return self.view.bounds.size.width * rightPanelVisibleWidth;
}

- (void)layoutPanelContainer {
    [self layoutCenterPanelContainer];
    [self layoutSidePanelContainer];
}

- (void)layoutCenterPanelContainer {
    
    CGRect centerPanelFrame = self.view.bounds;
    
    switch (self.slidingPanelState) {
        case LeftVisible:
            centerPanelFrame.origin.x = [self leftSlidingPanelVisibleWidth];
            break;
        case CenterVisible:
            centerPanelFrame.origin.x = 0.0;
            break;
        case RightVisible:
            centerPanelFrame.origin.x = centerPanelFrame.origin.x - [self rightSlidingPanelVisibleWidth];
            break;
    }
    
    self.centerPanelContainerView.frame = centerPanelFrame;
    self.centerPanelRestingFrame = centerPanelFrame;
}


// 에니메이션의 위치에 따라 최초의 위치를 결정하는 부분
- (void)layoutSidePanelContainer {
    
    CGRect leftPanelFrame = self.view.bounds;
//    CGRect rightPanelFrame = self.view.bounds;
    
    if (self.shouldAnimateSidePanel) {
        switch (self.slidingPanelState) {
            case LeftVisible:
                leftPanelFrame.origin.x = 0.0;
                leftPanelFrame.size.width = [self leftSlidingPanelVisibleWidth];
//                rightPanelFrame.origin.x = self.view.frame.size.width + [self leftSlidingPanelVisibleWidth];
            break;
        case CenterVisible:
                leftPanelFrame.origin.x = self.view.frame.origin.x - [self leftSlidingPanelVisibleWidth];
                leftPanelFrame.size.width = [self leftSlidingPanelVisibleWidth];
//                rightPanelFrame.origin.x = self.view.frame.size.width;
//                rightPanelFrame.size.width = [self rightSlidingPanelVisibleWidth];
            break;
        case RightVisible:
                leftPanelFrame.origin.x = self.view.frame.origin.x - leftPanelFrame.size.width;
//                rightPanelFrame.origin.x = rightPanelFrame.size.width - [self rightSlidingPanelVisibleWidth];
//                rightPanelFrame.size.width = [self rightSlidingPanelVisibleWidth];
                break;
            default:
                break;
        }
        
    } else {
        leftPanelFrame.origin.x = 0.0;
        leftPanelFrame.size.width = [self leftSlidingPanelVisibleWidth];
//        rightPanelFrame.origin.x = rightPanelFrame.origin.x - [self rightSlidingPanelVisibleWidth];
//        rightPanelFrame.size.width = [self rightSlidingPanelVisibleWidth];
    }
    
    self.leftPanelContainerView.frame = leftPanelFrame;
//    self.rightPanelContainerView.frame = rightPanelFrame;
}

#pragma mark - Hambuger Button Addition Methods
- (void)hamburgurButtonForLeftPanel {
    
    if (self.leftPanel != nil) {
        if ([self.centerPanel isKindOfClass:[UINavigationController class]]) {
            
            // hamburgurButtonForLeftPanel 을버튼 객체로 만들어서 이미지 색깔 변경
            UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [testBtn setFrame:CGRectMake(0, 0, 20, 13)];
            [testBtn addTarget:self action:@selector(toggleLeftSlidingPanel) forControlEvents:UIControlEventTouchUpInside];
            [testBtn setImage:[self drawIconImage] forState:UIControlStateNormal];
            
            UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:testBtn];
            ((UINavigationController*)self.centerPanel).viewControllers.firstObject.navigationItem.leftBarButtonItem = barButton;

//            UIBarButtonItem *barButton =  [[UIBarButtonItem alloc] initWithImage:[self drawIconImage]
//                                                                style:UIBarButtonItemStyleDone
//                                                                target:self
//                                                                action:@selector(toggleLeftSlidingPanel)];
//            barButton.tintColor = [UIColor brownColor];
//            ((UINavigationController*)self.centerPanel).viewControllers.firstObject.navigationItem.leftBarButtonItem = barButton;
        }
    }
}

//- (void)hamburgurButtonForRightPanel
//{
//    
//    if (self.rightPanel != nil) {
//        if ([self.centerPanel isKindOfClass:[UINavigationController class]]) {
//            UIBarButtonItem *barButton =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:rightIconName]
//                                                                           style:UIBarButtonItemStyleDone
//                                                                          target:self
//                                                                          action:@selector(toggleRightSlidingPanel)];
//            barButton.tintColor = [UIColor blackColor];
//            ((UINavigationController*)self.centerPanel).viewControllers.firstObject.navigationItem.rightBarButtonItem = barButton;
//        }
//        
//    }
//}

//    open override var shouldAutorotate: Bool {
//        get {
//            if let controller = self.visibleController {
//                if self.shouldAutoRotationEnabled {
//
//                    return controller.shouldAutorotate
//                }
//            }
//
//            return false
//        }
//    }
//
//    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
//
//        self.layoutPanelContainer()
//        self.styleForContainer(containerView: self.centerPanelContainerView, animationOption: false)
//    }
//
#pragma mark - Internal Methods
- (void)animateCenterSlidingPanelOnCompletion:(void(^)(bool finished))completion {
    
    [UIView animateKeyframesWithDuration:animationDuration
                            delay:0.0
                            options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionLayoutSubviews //Layout subviews at commit time so that they are animated along with their parent.
                            animations:^{
                                [self layoutPanelContainer];
                            } completion:^(BOOL finished) {
                                  //동작 안하는듯;;
                                  if (self.shouldBounceEnableSliding) {
                                      [UIView animateWithDuration:bounceDuration
                                              delay:0.0
                                              options:UIViewAnimationOptionCurveEaseIn
                                              animations:^{
                                                  [self layoutCenterPanelContainer];
                                              }
                                              completion:nil];
                                  }
                                  completion(finished);
                              }];
}


//그림자 넣기
- (void)styleForContainerView:(UIView *)containerView animationOption:(BOOL)animated {
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:containerView.bounds];
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
        animation.fromValue = (__bridge id _Nullable)([containerView.layer shadowPath]);
        animation.toValue = (__bridge id _Nullable)([shadowPath CGPath]);
        animation.duration = 0.2;
        [containerView.layer addAnimation:animation forKey:@"shadowPath"];
    }
    
    containerView.layer.shadowPath = (__bridge CGPathRef _Nullable)((__bridge id _Nullable)([shadowPath CGPath]));
    containerView.layer.shadowColor = [[UIColor blackColor] CGColor];
    containerView.layer.shadowRadius = 2.0;
    containerView.layer.shadowOpacity = 0.75;
    containerView.clipsToBounds = NO;
    
}


#pragma mark - Gesture(Tap/Pan)  Methods
/*
- (void)addTapViewOnCenterPanelContainer {
 
    if (self.tapView == nil) {
        self.tapView = [[UIView alloc] init];
        self.tapView.backgroundColor = [UIColor clearColor];
        self.tapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    self.tapView.frame = self.centerPanelContainerView.bounds;
    [self.centerPanelContainerView addSubview:self.tapView];
    [self.centerPanelContainerView bringSubviewToFront:self.tapView];
    
    if (self.shouldTapEnabledSliding) {
        [self addTapGestureToView:self.tapView];
    }
    
    if (self.shouldPanEnabledSliding) {
        [self addPanGestureToView:self.tapView];
    }
}

- (void)removeTapViewOnCenterPanelContainer {
    [self.tapView removeFromSuperview];
}

- (void)addTapGestureToView:(UIView *)gView {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCenterPanelAnimation:)];
    [gView addGestureRecognizer:tapGesture];
}

- (void)addPanGestureToView:(UIView *)gView {
 
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 1;
    panGesture.minimumNumberOfTouches = 1;
    [gView addGestureRecognizer:panGesture];
}


- (void)handlePan:(UIPanGestureRecognizer *)gesture {
 
    if (!self.shouldPanEnabledSliding) {
        return;
    }
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.locationBeforePan = self.centerPanelContainerView.frame.origin;
    }
    
    CGPoint translate = [gesture translationInView:self.centerPanelContainerView];
    CGRect frame = self.centerPanelRestingFrame;
    frame.origin.x += [self correctMovement:translate.x];
    
    self.centerPanelContainerView.frame = frame;
    
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        CGFloat deltaX =  frame.origin.x - self.locationBeforePan.x;
        if ([self validateThresoldPanMovement:deltaX]) {
            switch (self.slidingPanelState) {
                case CenterVisible:
                    if (deltaX > 0.0) {
//                        [self showLeftPanelWithAnimated:YES];
                    } else {
                        [self showRightPanelAnimation:YES];
                    }
                    break;
                case LeftVisible:
                case RightVisible:
                    [self showCenterPanelAnimation:YES];
                    break;
                default:
                    break;
            }
        } else {
            [self undoPanEvent];
        }
    } else if (gesture.state == UIGestureRecognizerStateCancelled) {
        [self undoPanEvent];
    }

}
- (void)undoPanEvent {
 
    switch (self.slidingPanelState) {
        case LeftVisible:
            //        self.showLeftPanel(animated: true)
            break;
        case CenterVisible:
            [self showCenterPanelAnimation:YES];
            
            break;
        case RightVisible:
            [self showRightPanelAnimation:YES];
            break;
    }
}

-(CGFloat)correctMovement:(CGFloat)movement {
 
    CGFloat position = (self.centerPanelRestingFrame.origin.x) + movement;
    
    switch (self.slidingPanelState) {
        case LeftVisible:
            if (position > self.leftSlidingPanelVisibleWidth) {
                return 0.0;
            }
            else if  (position < 0.0) {
                return -self.centerPanelRestingFrame.origin.x;
            }
            else if (position < self.leftPanelContainerView.frame.origin.x) {
                return self.leftPanelContainerView.frame.origin.x - self.centerPanelRestingFrame.origin.x;
            }
            break;
        
        case CenterVisible:
//            if ((position > 0.0  && self.leftPanel == nil) || (position < 0.0  && self.rightPanel == nil)) {
            if ((position > 0.0  && self.leftPanel == nil)) {
                return 0.0;
            }
            else if (self.shouldAllowRightOverPanning &&  position > self.leftSlidingPanelVisibleWidth) {
                return self.leftSlidingPanelVisibleWidth;
            }
            else if (self.shouldAllowRightOverPanning && position < -self.rightSlidingPanelVisibleWidth) {
                return -self.rightSlidingPanelVisibleWidth;
            }
            break;
            
            
        case RightVisible:
            if (position < -self.rightSlidingPanelVisibleWidth) {
                return 0.0;
            }
            else if  (position > 0.0) {
                return -self.centerPanelRestingFrame.origin.x;
            }
            else if (position > self.rightPanelContainerView.frame.origin.x) {
                return self.rightPanelContainerView.frame.origin.x - self.centerPanelRestingFrame.origin.x;
            }
            break;
    }
    
    return movement;
}

- (BOOL)validateThresoldPanMovement:(CGFloat)delta {

    CGFloat minimum = self.view.bounds.size.width * panMovementThresold;
    
    switch (self.slidingPanelState) {
        case LeftVisible:
            return delta <= -minimum;
            
        case CenterVisible:
            return fabs(delta) >= minimum;
            
        case RightVisible:
            return delta >= minimum;
    }
}
*/
#pragma mark - Center Sliding Panel show/hide method

- (void)showCenterPanelAnimation:(BOOL)animated {
    
    self.slidingPanelState = CenterVisible;
    [self hamburgurButtonForLeftPanel];
//    [self hamburgurButtonForRightPanel];
    
    if (animated) {
        [self animateCenterSlidingPanelOnCompletion:^(bool finished) {
//            [self removeTapViewOnCenterPanelContainer];
        }];
    }else {
        [self layoutPanelContainer];
        [self styleForContainerView:self.centerPanelContainerView animationOption:YES];
//        [self removeTapViewOnCenterPanelContainer];
    }
}

#pragma mark - Right Sliding Panel show/hide methods
/*
- (void)toggleRightSlidingPanel
{
    if (self.slidingPanelState == RightVisible) {
        
        [self showCenterPanelAnimation:YES];
    }
    else {
        [self showRightPanelAnimation:YES];
    }
}

- (void)showRightPanelAnimation:(BOOL)animated
{
    self.slidingPanelState = RightVisible;
    
    if (animated) {
        [self animateCenterSlidingPanelOnCompletion:^(bool finished) {
//            [self.rightPanel viewWillAppear:animated];
//            [self addTapViewOnCenterPanelContainer];
        }];
    }else {
        [self layoutPanelContainer];
        [self styleForContainerView:self.centerPanelContainerView animationOption:YES];
//        [self.rightPanel viewWillAppear:YES];
//        [self addTapViewOnCenterPanelContainer];
    }
}
 */
#pragma mark - Left Sliding Panel show/hide methods
- (void)toggleLeftSlidingPanel {
   
    if (self.slidingPanelState == LeftVisible) {
        [self showCenterPanelAnimation:YES];
    } else {
        [self showLeftPanelAnimation:YES];
    }
}


- (void)showLeftPanelAnimation:(BOOL)animated {
    
    self.slidingPanelState = LeftVisible;
    
    if (animated) {
        [self animateCenterSlidingPanelOnCompletion:^(bool finished) {
//            [self.leftPanel viewWillAppear:animated];
//            [self addTapViewOnCenterPanelContainer];
        }];
    } else {
        [self layoutPanelContainer]; //에니메이션이 안들어간 채로 요청 따라서 딱~ 하는 모양처럼 나타남
        [self styleForContainerView:self.centerPanelContainerView animationOption:YES];
        [self.leftPanel viewWillAppear:YES];
//        [self addTapViewOnCenterPanelContainer];
    }
}


#pragma mark - Checking controller is on top level or not
// Gesture에서 사용됨
/*
- (BOOL)isTopeLevelViewController:(UIViewController *)controller
{
    if (controller == nil)
    {
        return NO;
    }
    
    if ([controller isKindOfClass:[UINavigationController class]]) {
        return (((UINavigationController *)controller).viewControllers.count == 1);
    }
    return NO;
}
 */
#pragma mark - UIGestureRecognizerDelegate
/*
-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.view == self.tapView) {
        return YES;
    }else if (self.shouldPanningLimitedToTopViewController && ![self isTopeLevelViewController:self.centerPanel]) {
        return NO;
    }else
    {
        CGPoint translate = [gestureRecognizer translationInView:self.centerPanelContainerView];
        
        if (translate.x < 0 && !self.shouldAllowRightOverPanning) {
            return NO;
        }
        
        if (translate.x > 0 && !self.shouldAllowLeftOverPanning) {
            return NO;
        }
        
        CGFloat possible = translate.x != 0 && ((fabs(translate.y) / fabs(translate.x)) < 1.0);
//        if (possible && ((translate.x > 0 && self.leftPanel != nil) || (translate.x < 0 && self.rightPanel != nil))) {
        if (possible && ((translate.x > 0 && self.leftPanel != nil))) {
            return YES;
        }
        
    }
    return NO;
}
*/
    //MARK: Hamburgur image
- (UIImage *)drawIconImage {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(20, 13), NO, 0.0);
    [[UIColor redColor] setFill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 20, 1)] fill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 5, 20, 1)] fill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 10, 20, 1)] fill];
    
    [[UIColor greenColor] setFill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 1, 20, 2)] fill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 6, 20, 2)] fill];
    [[UIBezierPath bezierPathWithRect:CGRectMake(0, 11, 20, 2)] fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end






