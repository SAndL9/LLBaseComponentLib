//
//  JLSliderView.h
//  LLBaseComponentLib
//
//  Created by LiLei on 10/5/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JLSliderViewDelegate <NSObject>

-(void)sliderViewDidSliderLeft:(NSUInteger )leftValue right:(NSUInteger )rightValue;

@end





typedef NS_ENUM(NSInteger, JLSliderType) {
    //滑动的在轴上
    JLSliderTypeCenter = 0,
    JLSliderTypeBottom = 1,
};



@interface JLSliderView : UIView

@property (strong, nonatomic) UIColor *thumbColor;

@property (strong, nonatomic) UIColor *bgColor;

@property (assign, nonatomic) NSUInteger minValue;


@property (assign, nonatomic) NSUInteger maxValue;

@property (assign, nonatomic) JLSliderType sliderType;

@property (assign, nonatomic, readonly) NSUInteger currentMinValue;

@property (assign, nonatomic, readonly) NSUInteger currentMaxValue;

@property (assign, nonatomic) id<JLSliderViewDelegate> delegate;


-(instancetype)initWithFrame:(CGRect)frame sliderType:(JLSliderType )type;





@end


NS_ASSUME_NONNULL_END
