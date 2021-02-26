//
//  MutilTakePhViewController.m
//  QDialog
//
//  Created by 公智能 on 2020/10/16.
//  Copyright © 2020 Don. All rights reserved.
//

#import "MutilTakePhViewController.h"
#import "ZBWPhotosManager.h"
#import "PhotosTableViewController.h"
#import "MWPhotoBrowser.h"


@interface MutilTakePhViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *albumCollectionView;

@property (nonatomic, strong) NSArray *array;

@end

@implementation MutilTakePhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"选图" style:(UIBarButtonItemStyleDone) target:self action:@selector(opentt)];
    [self albumCollectionView];
}
-(void)opentt{
    PhotosTableViewController *vc = [[PhotosTableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)choosePic:(id)sender {
    [ZBWPhotosManager showPhotosManager:self withMaxImageCount:5 withAlbumArray:^(NSMutableArray<ZBWPhotoModel *> * _Nonnull albumArray) {
        NSLog(@"%@",albumArray);
        self.array = albumArray;
        [self.albumCollectionView reloadData];
        
    }];
}

#pragma mark - UICollectionViewDataSource / UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ddd" forIndexPath:indexPath];
    
    ZBWPhotoModel *model = self.array[indexPath.row];
    
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [cell addSubview:imageV];
    imageV.image = model.highDefinitionImage;
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *arr = [NSMutableArray array];
    for (ZBWPhotoModel *model in self.array) {
        MWPhoto *photo = [[MWPhoto alloc]initWithImage:model.highDefinitionImage];
        [arr addObject:photo];
    }
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithPhotos:arr];
    browser.displayActionButton = YES;
    browser.displayNavArrows = YES;
    browser.displaySelectionButtons = YES;
    browser.alwaysShowControls = YES;
    browser.zoomPhotosToFill = YES;
    browser.enableGrid = NO;
    browser.startOnGrid = YES;
    browser.enableSwipeToDismiss = NO;
    browser.autoPlayOnAppear = NO;
    [browser setCurrentPhotoIndex:indexPath.item];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
    [nc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                                  NSForegroundColorAttributeName:[UIColor whiteColor]}];
    nc.modalPresentationStyle = UIModalPresentationFullScreen;
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];


    
}

- (UICollectionView *)albumCollectionView {
    if (!_albumCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 5.f;
        layout.minimumInteritemSpacing = 5.f;
        _albumCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.5) collectionViewLayout:layout];
        _albumCollectionView.delegate = self;
        _albumCollectionView.dataSource = self;
        _albumCollectionView.backgroundColor = [UIColor whiteColor];
        _albumCollectionView.scrollEnabled = YES;
        _albumCollectionView.alwaysBounceVertical = YES;
        [_albumCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ddd"];
        [self.view addSubview:_albumCollectionView];
    }
    
    return _albumCollectionView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 20.f) / 3.f, ([UIScreen mainScreen].bounds.size.width - 20.f) / 3.f);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
