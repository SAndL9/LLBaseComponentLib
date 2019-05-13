//
//  LLNumberButtonViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLNumberButtonViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>

@interface LLNumberButtonViewController ()<LLNumberButtonDelegate>

@property (nonatomic, strong) LLNumberButton *numberButton;

@end

@implementation LLNumberButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _numberButton = [[LLNumberButton alloc]initWithFrame:CGRectMake(50, 150, 150, 40)];
    [self.view addSubview:self.numberButton];
    _numberButton.delegate = self;
    _numberButton.maxNumber = 100;
    [_numberButton setTitleWithIncreaseTitle:@"加" decreaseTitle:@"减"];
    
}

- (void)NumberButton:(UIView *)numberButton number:(NSString *)number{
    
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
