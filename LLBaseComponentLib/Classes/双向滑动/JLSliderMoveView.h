//
//  JLSliderMoveView.h
//  LLBaseComponentLib
//
//  Created by LiLei on 10/5/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SlidMoveDelegate <NSObject>

-(void)slidMovedLeft:(CGFloat)leftPosition andRightPosition:(CGFloat) rightPosition;



-(void)slidDidEndMovedLeft:(CGFloat)leftPosition andRightPosition:(CGFloat) rightPosition;


@end

@interface JLSliderMoveView : UIView
@property (assign, nonatomic) CGFloat   leftPosition;
@property (assign, nonatomic) CGFloat   rightPosition;
@property (assign, nonatomic) BOOL isRound;
@property (strong, nonatomic) UIColor *thumbColor;
@property (weak,   nonatomic) id <SlidMoveDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
