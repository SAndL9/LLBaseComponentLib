//
//  LLViewController.m
//  LLBaseComponentLib
//
//  Created by SAndL9 on 05/09/2019.
//  Copyright (c) 2019 SAndL9. All rights reserved.
//

#import "LLViewController.h"
#import <LLBaseComponentLib/LLBaseComponentLib.h>
@interface LLViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@end

@implementation LLViewController



#pragma mark-
#pragma mark- View Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"LLBaseComponentLib";
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]init];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"LLBaseComponentLib" ofType:@"plist"];
    
    self.dataSourceArray = [[NSMutableArray alloc]initWithContentsOfFile:path];
}



#pragma mark-
#pragma mark- 代理类名 delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSDictionary *dict = self.dataSourceArray[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary  *dict = self.dataSourceArray[indexPath.row];
    NSString *str = dict[@"ViewControllerName"];
    UIViewController *controller = [[NSClassFromString(str) alloc] init];

    [self.navigationController pushViewController:controller animated:YES];
    
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
