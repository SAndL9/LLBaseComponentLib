//
//  LLHorizontalCollectionDemoViewCell.h
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^jobPointDeleteBlock) ();

@interface LLHorizontalCollectionDemoViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, copy) jobPointDeleteBlock block;
@end

NS_ASSUME_NONNULL_END
