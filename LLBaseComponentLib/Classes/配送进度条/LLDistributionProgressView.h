//
//  LLDistributionProgressView.h
//  LLBaseComponentLib
//
//  Created by LiLei on 13/5/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLDistributionProgressView : UIView
@property(nonatomic,assign)NSInteger index; //确定哪个状态
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@end

NS_ASSUME_NONNULL_END
