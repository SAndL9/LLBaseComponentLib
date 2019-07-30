//
//  LLNumberButtonViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLNumberButtonViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>

@interface LLNumberButtonViewController ()<LLNumberButtonDelegate,UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textfield;
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
    _numberButton.backgroundColor = [UIColor lightGrayColor];
    [_numberButton setTitleWithIncreaseTitle:@"加" decreaseTitle:@"减"];
 
    _textfield = [[UITextField alloc]initWithFrame:CGRectMake(10, 300, 250, 40)];
    _textfield.placeholder = @"请输入数字";
    _textfield.backgroundColor = [UIColor orangeColor];
    _textfield.delegate = self;
    
    [self.view addSubview:_textfield];
    
}

#pragma mark-
#pragma mark- LLNumberButtonDelegate
- (void)NumberButton:(UIView *)numberButton number:(NSString *)number{
    
}


#pragma mark-
#pragma mark- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.textfield) {
        // 4位分隔银行卡卡号
        NSString *text = [textField text];
        
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
            return NO;
        }
        
        text = [text stringByReplacingCharactersInRange:range withString:string];
        text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSString *newString = @"";
        while (text.length > 0) {
            NSString *subString = [text substringToIndex:MIN(text.length, 4)];
            newString = [newString stringByAppendingString:subString];
            if (subString.length == 4) {
                newString = [newString stringByAppendingString:@" "];
            }
            text = [text substringFromIndex:MIN(text.length, 4)];
        }
        
        newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
        
        if ([newString stringByReplacingOccurrencesOfString:@" " withString:@""].length >= 19) {
            return NO;
        }
        
        [textField setText:newString];
        
        return NO;
    }
    return YES;
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
