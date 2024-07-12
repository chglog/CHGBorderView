//
//  ViewController.m
//  CHGBorderView
//
//  Created by 嘉爸爸 on 2024/7/12.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加tableV
    [self.view addSubview:self.tableV];
    
    // 注册自定义的 Cell
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableV registerNib:nib forCellReuseIdentifier:@"TableViewCellID"];

}

#pragma mark - tableV的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellID" forIndexPath:indexPath];
    // 设置UI
    NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
    if (indexPath.row == 0) {
        cell.bgView.isFirstCell = YES;
        cell.bgView.isLastCell = NO;
        cell.bgView.borderType = CHG_BorderTypeTop | CHG_BorderTypeLeft | CHG_BorderTypeRight;
    } else if (indexPath.row == numberOfRows - 1) {
        cell.bgView.isFirstCell = NO;
        cell.bgView.isLastCell = YES;
        cell.bgView.borderType = CHG_BorderTypeBottom | CHG_BorderTypeLeft | CHG_BorderTypeRight;
    } else {
        cell.bgView.isFirstCell = NO;
        cell.bgView.isLastCell = NO;
        cell.bgView.borderType = CHG_BorderTypeLeft | CHG_BorderTypeRight;
    }
    [cell.bgView setNeedsLayout]; // 必须调用重新绘制边框
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

// footerV
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}


#pragma mark - lazy
- (UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableV.dataSource = self;
        _tableV.delegate = self;
        _tableV.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    }
    return _tableV;
}
@end
