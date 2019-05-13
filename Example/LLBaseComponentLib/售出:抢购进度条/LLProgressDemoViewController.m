//
//  LLProgressDemoViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLProgressDemoViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
@interface LLProgressDemoViewController ()
@property (nonatomic, strong) LLProgressView *progressView;

@end

@implementation LLProgressDemoViewController
#pragma mark-
#pragma mark- View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self testProgressView];
    
}
#pragma mark-
#pragma mark- Request


#pragma mark-
#pragma mark- SANetworkResponseProtocol


#pragma mark-
#pragma mark- <#代理类名#> delegate

#pragma mark-
#pragma mark- Event response

#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters

#pragma mark-
#pragma mark- SetupConstraints
- (void)testProgressView{
    _progressView = [[LLProgressView alloc]initWithFrame:CGRectMake(20, 160, 200, 40)];
    _progressView.title = @"已售12345件";
    _progressView.progress = 0.33;
    [self.view addSubview:_progressView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.progressView playAnimation];
    self.progressView.title = @"已售23456件";
    _progressView.progress = 0.63;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
