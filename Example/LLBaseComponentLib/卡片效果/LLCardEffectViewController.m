//
//  LLCardEffectViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 10/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLCardEffectViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
@interface LLCardEffectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *mainCollectionView;
@property (nonatomic,assign) NSInteger itemCount;
@property (nonatomic,assign) CGRect collectionViewFrame;

@end

@implementation LLCardEffectViewController
#pragma mark-
#pragma mark- View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    LLCollectionFlowLayout *layout = [[LLCollectionFlowLayout alloc]init];
    layout.minimumLineSpacing = 15;
    layout.itemSize = CGSizeMake(SCREEN_WIDTH - LEFT_OFFSET*2, (SCREEN_WIDTH - LEFT_OFFSET*2)/0.618f);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(64, LEFT_OFFSET, 0, LEFT_OFFSET);
    self.mainCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.mainCollectionView.showsHorizontalScrollIndicator = NO;
    //    self.mainCollectionView.contentInset = UIEdgeInsetsMake(64, LEFT_OFFSET, 0, LEFT_OFFSET);
    [self.view addSubview:self.mainCollectionView];
    //注册cell
    [self.mainCollectionView registerClass:[UICollectionViewCell class]
                forCellWithReuseIdentifier:@"cell"];
}
#pragma mark-
#pragma mark- <#代理类名#> delegate
- (NSInteger )numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView * view in cell.subviews)
    {
        [view removeFromSuperview];
    }
    
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = cell.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    [cell addSubview:label];
    label.text = [NSString stringWithFormat:@"分区%ld行%ld",(long)indexPath.section,(long)indexPath.row];
    cell.backgroundColor= [UIColor colorWithRed: arc4random_uniform(256)/255.0f green: arc4random_uniform(256)/255.0f blue: arc4random_uniform(256)/255.0f alpha:1];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 5.0f;
    
    
    NSLog(@"Cell:%f--%f",cell.frame.size.width,cell.frame.size.height);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了----%ld---%ld",(long)indexPath.section,(long)indexPath.row);
}
#pragma mark-
#pragma mark- Event response

#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters

#pragma mark-
#pragma mark- SetupConstraints
- (void)setupSubviewsContraints {
    
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
