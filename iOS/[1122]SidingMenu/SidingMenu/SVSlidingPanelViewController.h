//
//  ViewController.h
//  SidingMenu
//
//  Created by youngmin joo on 2016. 11. 17..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    LeftVisible,
    CenterVisible,
    RightVisible
}SVSlidingPanelState;


static NSString *leftIconName = @"";
static NSString *rightIconName = @"";
//MARK: - Width(Percentage of screen) that will show left sliding panel

// Default Value - 0.5 (Range between 0 and 1)
static CGFloat leftPanelVisibleWidth = 0.5;
//MARK: - Width(Percentage of screen) that will show right sliding panel
// Default Value - 0.5 (Range between 0 and 1)
static CGFloat rightPanelVisibleWidth = 0.5;
//MARK: - Movement(Percentage of screen) after that panel will toggel its state
// Default Value - 0.15 (Range between 0 and 1)
static CGFloat panMovementThresold = 0.15;
//MARK: - Time used for animation while toggling sliding panels
// Default Value - 0.3 (Seconds)
static CGFloat animationDuration = 0.3;
//MARK: - Time used for bounce while toggling sliding panels
// Default Value - 0.3 (Seconds)
static CGFloat bounceDuration = 0.3;


@interface SVSlidingPanelViewController : UIViewController
<UIGestureRecognizerDelegate>

//Use Gesture
////MARK: - Enabling panning on center sliding panel
//@property BOOL shouldPanEnabledSliding;//YES
////MARK: - Enabling panning on  top view controller of
//// center sliding panel only
//@property BOOL shouldPanningLimitedToTopViewController;//YES
////MARK: - Enabling  left over panning on center sliding panel
//@property BOOL shouldAllowLeftOverPanning;//YES
////MARK: - Enabling right over panning on center sliding panel
//@property BOOL shouldAllowRightOverPanning;//YES
//
////MARK: - Enabling tapping on center sliding panel
//@property BOOL shouldTapEnabledSliding;//YES
////MARK: - Enabling rotaion of controller with rotation of device
//@property BOOL shouldAutoRotationEnabled;//YES

//-----------------------------------------------------

//MARK: - Applying animation while toggling side panel
@property BOOL shouldAnimateSidePanel;//NO
//MARK: - Applying animation while toggling side panel
@property BOOL shouldBounceEnableSliding;//YES

//MARK: - return current visible controller
@property UIViewController *visibleController;

@property (nonatomic,strong) UIViewController *leftPanel;
@property (nonatomic,strong) UIViewController *centerPanel;
//@property (nonatomic,strong) UIViewController *rightPanel;


- (void)showCenterPanelAnimation:(BOOL)animated;


@end

