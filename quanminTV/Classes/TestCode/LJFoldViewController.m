//
//  LJFoldViewController.m
//  quanminTV
//
//  Created by liang on 16/10/20.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJFoldViewController.h"

@interface LJFoldViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    BOOL isOpen[20];
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LJFoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 20; i++) {
        isOpen[i]= YES;
    }
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - **************** UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4 && isOpen[section];
}

static NSString * const CellId = @"CellId";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 40)];
    sectionView.backgroundColor = [UIColor lightGrayColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = section;
    [btn setTitle:@"test" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(headerBtnCkick:) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    [sectionView addSubview:btn];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)headerBtnCkick:(UIButton *)sender {
    isOpen[sender.tag] = !isOpen[sender.tag];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
