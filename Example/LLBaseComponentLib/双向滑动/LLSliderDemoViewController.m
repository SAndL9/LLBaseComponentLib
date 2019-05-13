//
//  LLSliderDemoViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 10/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLSliderDemoViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
@interface LLSliderDemoViewController ()

@property (strong, nonatomic) JLSliderView *sliderView;

@end

@implementation LLSliderDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.sliderView = [[JLSliderView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 60) ];
    self.sliderView.sliderType = JLSliderTypeCenter;
    [self.view addSubview:self.sliderView];
    JLSliderView  *sliderView2 = [[JLSliderView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width,100) ];
    sliderView2.sliderType = JLSliderTypeBottom;
    [self.view addSubview:sliderView2];}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
