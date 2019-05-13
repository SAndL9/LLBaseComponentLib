//
//  LLDistributionProgressViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLDistributionProgressViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>

#define Device_Height [[UIScreen mainScreen] bounds].size.height
#define Device_Width  [[UIScreen mainScreen] bounds].size.width//获取屏幕宽高
@interface LLDistributionProgressViewController ()

@property(nonatomic,strong) LLDistributionProgressView *progressView;

@end

@implementation LLDistributionProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.progressView =[[LLDistributionProgressView alloc]initWithFrame:CGRectMake(0, 100, Device_Width, 62) titleArray:@[@"已接单",@"已装货",@"运输中",@"已卸货",@"已完成"]];
    self.progressView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.progressView];
    
    self.progressView.index = 1;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.progressView.index = arc4random()%5;
    NSLog(@"%ld",self.progressView.index);
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
