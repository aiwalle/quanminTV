//
//  LJMineViewController.m
//  quanminTV
//
//  Created by liang on 16/8/31.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJMineViewController.h"

@interface LJMineViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *mineTableV;
@property (nonatomic, strong) UIView *mineHeaderView;
@end
@implementation LJMineViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mineTableV];
    [self addMineHeaderView];
}

- (UITableView *)mineTableV {
    if (!_mineTableV) {
        _mineTableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mineTableV.backgroundColor = [UIColor whiteColor];
        _mineTableV.dataSource = self;
        _mineTableV.delegate = self;
        _mineTableV.rowHeight = 50;
    }
    return _mineTableV;
}

- (void)addMineHeaderView {
    _mineHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 200)];
    _mineHeaderView.backgroundColor = [UIColor redColor];
    _mineTableV.tableHeaderView = _mineHeaderView;
}
#pragma mark - **************** UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

static NSString * const CellId = @"MineCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellId];
    }
    cell.imageView.image = [UIImage imageNamed:@"logisticicon"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
