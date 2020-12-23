//
//  JiheController.m
//  QDialog
//
//  Created by 公智能 on 2020/10/21.
//  Copyright © 2020 Don. All rights reserved.
//

#import "JiheController.h"
#import "JiheController_1.h"
@interface JiheController ()
@property(nonatomic,strong)NSArray *arrs;
@end

@implementation JiheController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"几何方法";
    [self.datas addObjectsFromArray:@[@"使用CGRectDivide",@"文字Rect居中绘制",@"图像在Rect中Fit绘制",@"图像在Rect中Fill绘制"]];
    self.arrs = @[@"JiheController_1"];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [NSClassFromString(self.arrs[indexPath.row]) new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
