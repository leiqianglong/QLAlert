//
//  PhotoTableViewCell.m
//  QDialog
//
//  Created by 公智能 on 2021/2/25.
//  Copyright © 2021 Don. All rights reserved.
//

#import "PhotoTableViewCell.h"
#import "ZBWPhotosManager.h"
#import "Masonry.h"
#import "PhotoCollectionViewCell.h"
#define itemWH (([UIScreen mainScreen].bounds.size.width - 100.f) / 3.f)

@interface PhotoTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *albumCollectionView;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,assign)BOOL isShowImg;//显示图片 yes
@end

@implementation PhotoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.array = [NSMutableArray array];
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(10);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(100);
    }];
    self.leftTitle = [[UILabel alloc]init];
    self.leftTitle.textColor = [UIColor lightGrayColor];
    self.leftTitle.font = [UIFont systemFontOfSize:15];
    [leftView addSubview:self.leftTitle];
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftView).offset(10);
        make.left.equalTo(leftView).offset(15);
        make.right.equalTo(leftView).offset(-10);
    }];
    
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.left.mas_equalTo(leftView.mas_right);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
    }];
    
    [rightView addSubview:self.albumCollectionView];
    [self.albumCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(rightView);
        make.height.mas_equalTo(itemWH);
    }];
    
}

//若只是显示图片功能
-(void)setShowImgArr:(NSArray *)showImgArr{
    self.isShowImg = YES;
    [self.array removeLastObject];
    [self.array addObjectsFromArray:showImgArr];
    [self reloadCollecImages];
}
-(void)reloadCollecImages{

    CGFloat height = 0;
    
    if (self.isShowImg) {
        if (self.array.count <= 3) {
            height = itemWH ;
        }else if (self.array.count > 3 && self.array.count <= 6){
            height = itemWH * 2 ;
        }else if (self.array.count > 6 && self.array.count <= 9){
            height = itemWH * 3 ;
        }else{
            height = 0;
        }
    }else{
        if (self.array.count < 3) {
            height = itemWH ;
        }else if (self.array.count >= 3 && self.array.count < 6){
            height = itemWH * 2 ;
        }else if (self.array.count >= 6 && self.array.count <= 9){
            height = itemWH * 3 ;
        }else{
            height = 0;
        }
    }
    [self.albumCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    [self.albumCollectionView reloadData];
}

#pragma mark - UICollectionViewDataSource / UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.isShowImg) {
        return self.array.count;
    }else{
        if (self.array.count == 9) {
            return self.array.count;
        }
        return self.array.count + 1;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    if (self.isShowImg) {
        ZBWPhotoModel *model = self.array[indexPath.row];
        cell.imageView.image = model.highDefinitionImage;
        cell.deleteBtn.hidden = YES;
    }else{
        cell.deleteBtn.tag = indexPath.item;
        [cell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        if (self.array.count == 9) {
            ZBWPhotoModel *model = self.array[indexPath.row];
            cell.imageView.image = model.highDefinitionImage;
            cell.deleteBtn.hidden = NO;
        }else{
            if (indexPath.row == self.array.count) { //最后一个+号
                cell.imageView.image = [UIImage imageNamed:@"相机图标小"];
                cell.deleteBtn.hidden = YES;
            }else{
                cell.deleteBtn.hidden = NO;
                ZBWPhotoModel *model = self.array[indexPath.row];
                cell.imageView.image = model.highDefinitionImage;
            }
        }
    }
    return cell;
}

-(void)deleteBtnClick:(UIButton *)sender{
    [self.array removeObjectAtIndex:sender.tag];
    [self reloadCollecImages];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.isShowImg) {
        //点击可以放大查看图片
        
        //.....
        
    }else{
        //点击了+号按钮-----跳转选择图片界面
        if (indexPath.row == self.array.count) {
            UIViewController *ctr = [self dc_findCurrentShowingViewController];
            __weak typeof(self) weakself = self;
            //图片总数量
            NSInteger count = 9 - self.array.count;
            [ZBWPhotosManager showPhotosManager:ctr withMaxImageCount:count withAlbumArray:^(NSMutableArray<ZBWPhotoModel *> * _Nonnull albumArray) {
                NSLog(@"%@",albumArray);
                [weakself.array addObjectsFromArray:albumArray];;
                if (weakself.photoBlock) {
                    weakself.photoBlock(albumArray);
                }
                [self reloadCollecImages];
        //        [self.albumCollectionView reloadData];
            }];
        }else{
            
        }
    }
}
// 获取当前显示的 UIViewController
- (UIViewController *)dc_findCurrentShowingViewController {
    //获得当前活动窗口的根视图
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentShowingVC = [self findCurrentShowingViewControllerFrom:vc];
    return currentShowingVC;
}
- (UIViewController *)findCurrentShowingViewControllerFrom:(UIViewController *)vc
{
    // 递归方法 Recursive method
    UIViewController *currentShowingVC;
    if ([vc presentedViewController]) {
        // 当前视图是被presented出来的
        UIViewController *nextRootVC = [vc presentedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];

    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        UIViewController *nextRootVC = [(UITabBarController *)vc selectedViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];

    } else if ([vc isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        UIViewController *nextRootVC = [(UINavigationController *)vc visibleViewController];
        currentShowingVC = [self findCurrentShowingViewControllerFrom:nextRootVC];

    } else {
        // 根视图为非导航类
        currentShowingVC = vc;
    }

    return currentShowingVC;
}

- (UICollectionView *)albumCollectionView {
    if (!_albumCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0.f;
        layout.minimumInteritemSpacing = 0.f;
        _albumCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _albumCollectionView.delegate = self;
        _albumCollectionView.dataSource = self;
        _albumCollectionView.backgroundColor = [UIColor whiteColor];
        _albumCollectionView.scrollEnabled = YES;
        _albumCollectionView.alwaysBounceVertical = YES;
        [_albumCollectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    }
    
    return _albumCollectionView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(itemWH,itemWH);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

@end
