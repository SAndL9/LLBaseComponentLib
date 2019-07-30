//
//  LLCollectionHeaderViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 30/7/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLCollectionHeaderViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
#import "LLCollectionReusableView.h"
static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseReusableIdentifier = @"reusableIdentifier";
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LLCollectionHeaderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LLCollectionHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviewsContraints];
}
#pragma mark-
#pragma mark- View Life Cycle

#pragma mark-
#pragma mark- Request


#pragma mark-
#pragma mark- SANetworkResponseProtocol


#pragma mark-
#pragma mark- <#代理类名#> delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 20;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    cell.contentView.backgroundColor = [UIColor purpleColor];
    return cell;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    LLCollectionReusableView * reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseReusableIdentifier forIndexPath:indexPath];
    reusableView.backgroundColor = [UIColor orangeColor];
    reusableView.headerLabel.text = [NSString stringWithFormat:@"第 %td 个HeaderView",indexPath.section];
    return reusableView;
}
#pragma mark-
#pragma mark- Event response

#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        LLSuspensionLayout *layout = [[LLSuspensionLayout alloc]init];
        layout.minimumLineSpacing      = 2;
        layout.minimumInteritemSpacing = 2;
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-8)/3, SCREEN_WIDTH*100.f/320.f);
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"LLCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseReusableIdentifier];
       
    }
    return _collectionView;
}
#pragma mark-
#pragma mark- SetupConstraints
- (void)setupSubviewsContraints {
    [self.view addSubview:self.collectionView];
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
