//
//  LLProgressView.h
//  LLBaseComponentLib
//
//  Created by LiLei on 13/5/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 售出 抢购进度条
 */
@interface LLProgressView : UIView
/** 售出文案 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) CGFloat progress;

- (void)playAnimation;
@end

NS_ASSUME_NONNULL_END
