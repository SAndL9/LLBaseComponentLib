//
//  LLHorizontalCollectionDemoViewController.m
//  LLBaseComponentLib_Example
//
//  Created by LiLei on 13/5/2019.
//  Copyright © 2019 SAndL9. All rights reserved.
//

#import "LLHorizontalCollectionDemoViewController.h"
#import "LLHorizontalCollectionDemoViewCell.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
@interface LLHorizontalCollectionDemoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation LLHorizontalCollectionDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame= CGRectMake(20, 150, [UIScreen mainScreen].bounds.size.width - 40, 40);
    [_button setTitle:@"增加数据" forState:0];
    _button.backgroundColor = [UIColor brownColor];
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = 6;
    _pageControl.frame = CGRectMake(20, 205, [UIScreen mainScreen].bounds.size.width - 40, 30);
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _pageControl.currentPage = 0;
    _pageControl.enabled = NO;
    [self.view addSubview:_pageControl];
    
    
    _pageControl.numberOfPages = self.dataSourceArray.count / 4 + 1;
    
    
    
    [self configureCollectionView];
}

-(void)buttonClicked:(UIButton *)sender{
    [self.dataSourceArray addObject:[NSString stringWithFormat:@"添加的"]];
    if (_dataSourceArray.count % 4 == 0) {
        _pageControl.numberOfPages = self.dataSourceArray.count / 4;
    }else{
        _pageControl.numberOfPages = self.dataSourceArray.count / 4 + 1;
    }
    NSLog(@"+++++数据是%@",self.dataSourceArray);
    
    
    [_collectionView reloadData];
    [_collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.dataSourceArray.count - 1 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
    _pageControl.currentPage = _pageControl.numberOfPages - 1;
}


- (void)configureCollectionView {
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(0.0f, 12.0f, 0.0f, 12.0f);
    CGFloat columns = 2;
    CGFloat itemHeight = 100.0f;
    CGFloat horizontalGap = 13.0f;
    //
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - edgeInset.left - edgeInset.right - columns * horizontalGap + horizontalGap) / columns;
    
    
    
    LLHorizontalCollectionViewFlowLayout * layout = [[LLHorizontalCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.minimumInteritemSpacing = 12;
    layout.minimumLineSpacing = horizontalGap;
    layout.numberOfItemsInPage = 4;
    layout.columnsInPage = 2;
    layout.pageInset = edgeInset;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 225) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor blueColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[LLHorizontalCollectionDemoViewCell class] forCellWithReuseIdentifier:@"SACollectionViewCell"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LLHorizontalCollectionDemoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SACollectionViewCell" forIndexPath:indexPath];
    
    cell.nameLab.text = self.dataSourceArray[indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    cell.contentView.tag=indexPath.row;
    __weak __typeof(cell)weakCell = cell;
    cell.block = ^(){
        NSInteger row= weakCell.contentView.tag;
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是是否删除?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OK = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.dataSourceArray removeObjectAtIndex:row];
            NSLog(@"----删除的---%@",self.dataSourceArray);
            if (_dataSourceArray.count % 4 == 0) {
                _pageControl.numberOfPages = self.dataSourceArray.count / 4;
            }else{
                _pageControl.numberOfPages = self.dataSourceArray.count / 4 + 1;
            }
            
            [_collectionView reloadData];
            
        }];
        
        UIAlertAction *cancle1 = [UIAlertAction actionWithTitle:@"不删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:cancle1];
        [alertC addAction:OK];
        
        [self presentViewController:alertC animated:YES completion:nil];
        
        
        
        
        
        if (_dataSourceArray.count % 4 == 0) {
            _pageControl.numberOfPages = self.dataSourceArray.count / 4;
        }else{
            _pageControl.numberOfPages = self.dataSourceArray.count / 4 + 1;
        }
        
        [_collectionView reloadData];
    };
    return cell;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    NSInteger currenPag = (offset.x / _collectionView.frame.size.width + 0.5);
    [_pageControl setCurrentPage:currenPag];
}
-(NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 15; i++) {
            [_dataSourceArray addObject:[NSString stringWithFormat:@"测试 %d",i]];
        }
    }
    return _dataSourceArray;
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
