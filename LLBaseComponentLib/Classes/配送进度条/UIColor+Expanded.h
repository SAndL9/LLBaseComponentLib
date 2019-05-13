//
//  UIColor+Expanded.h
//  LLBaseComponentLib
//
//  Created by LiLei on 13/5/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Expanded)
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert andAlpha:(CGFloat)alpha;

+(UIColor *)defaultBackGroundColor;
+(UIColor *)commonBackGroundColor;
+(UIColor *)defaultTitleWordColor;
+(UIColor *)defaultContentWordColor;
@end

NS_ASSUME_NONNULL_END
