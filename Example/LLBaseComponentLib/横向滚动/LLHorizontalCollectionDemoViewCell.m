//
//  LLHorizontalCollectionDemoViewCell.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLHorizontalCollectionDemoViewCell.h"

@implementation LLHorizontalCollectionDemoViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame] ) {
        [self setUp];
        UILongPressGestureRecognizer* longgs=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressDeleteAction:)];
        [self.contentView addGestureRecognizer:longgs];//为cell添加手势
        longgs.minimumPressDuration=0.8;//定义长按识别时长
    }
    return self;
}
- (void)longPressDeleteAction:(UILongPressGestureRecognizer*)ges{
    if(ges.state==UIGestureRecognizerStateBegan){
        if (self.block) {
            self.block();
        }
    }
}
- (void)setUp {
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.borderColor = [UIColor purpleColor].CGColor;
    self.contentView.layer.cornerRadius = 14.0f;
    self.contentView.clipsToBounds = YES;
    self.contentView.backgroundColor = [UIColor whiteColor];
    //
    _nameLab = [[UILabel alloc] initWithFrame:self.bounds];
    self.nameLab.font = [UIFont systemFontOfSize:12.0f];
    self.nameLab.adjustsFontSizeToFitWidth = YES;
    self.nameLab.minimumScaleFactor = 0.4f;
    self.nameLab.textAlignment = NSTextAlignmentCenter;
    self.nameLab.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.nameLab];
    self.nameLab.translatesAutoresizingMaskIntoConstraints = NO;
    
}
@end
