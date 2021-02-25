//
//  PhotosTableViewController.m
//  QDialog
//
//  Created by 公智能 on 2021/2/25.
//  Copyright © 2021 Don. All rights reserved.
//

#import "PhotosTableViewController.h"
#import "PhotoTableViewCell.h"
#import "ZBWPhotosManager.h"
@interface PhotosTableViewController ()
@property(nonatomic,strong)NSMutableArray *images;
@end

@implementation PhotosTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[PhotoTableViewCell class] forCellReuseIdentifier:@"pcell"];
    self.tableView.estimatedRowHeight = 100;
    self.tableView.tableFooterView = [UIView new];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"选图" style:(UIBarButtonItemStyleDone) target:self action:@selector(btnClick)];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        PhotoTableViewCell *pcell = [tableView dequeueReusableCellWithIdentifier:@"pcell" forIndexPath:indexPath];
        __weak typeof(self) weakself = self;
        pcell.photoBlock = ^(NSMutableArray * _Nonnull images) {
            
            [weakself.tableView reloadData];
        };
        
        pcell.showImgArr = self.images;
        pcell.leftTitle.text = @"备注图片";
        return pcell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"标题：%ld",(long)indexPath.row];
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 3) {
//        return 100;
//    }
//    return 55;
//}


-(void)btnClick{
    [ZBWPhotosManager showPhotosManager:self withMaxImageCount:9 withAlbumArray:^(NSMutableArray<ZBWPhotoModel *> * _Nonnull albumArray) {
        NSLog(@"%@",albumArray);
        self.images = albumArray;
        [self.tableView reloadData];
    }];
}

@end
