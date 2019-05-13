//
//  LLHorizontalCollectionViewFlowLayout.h
//  LLBaseComponentLib
//
//  Created by LiLei on 13/5/2019.
//

#import <UIKit/UIKit.h>


UIKIT_EXTERN NSUInteger numberOfPages(NSUInteger itemsInPage, NSUInteger totalCount);

/**
 横向滚动flowLayout
 */
@interface LLHorizontalCollectionViewFlowLayout : UICollectionViewFlowLayout
/**
 每页的缩进
 */
@property (nonatomic, assign) UIEdgeInsets pageInset;
/**
 每个页面所包含的数量
 */
@property (nonatomic, assign) NSUInteger numberOfItemsInPage;
/**
 每页分多少列
 */
@property (nonatomic, assign) NSUInteger columnsInPage;
@end


