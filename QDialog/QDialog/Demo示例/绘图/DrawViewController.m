//
//  DrawViewController.m
//  QDialog
//
//  Created by 公智能 on 2020/10/21.
//  Copyright © 2020 Don. All rights reserved.
//

#import "DrawViewController.h"
#import "JiheController.h"
@interface DrawViewController ()
@property(nonatomic,strong)NSArray *arrs;
@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绘图";
    [self.datas addObjectsFromArray:@[@"几何方法",@"图像处理",@"路径解剖",@"阴影高光",@"渐变填充",@"遮罩模糊",@"动画与手势",@"文本与路径"]];
    self.arrs = @[@"JiheController"];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [NSClassFromString(self.arrs[indexPath.row]) new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
