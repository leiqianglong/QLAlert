//
//  TakePhoneController.m
//  QDialog
//
//  Created by 公智能 on 2020/10/15.
//  Copyright © 2020 Don. All rights reserved.
//

#import "TakePhoneController.h"
#import "FQPhotoAlbum.h"
@interface TakePhoneController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv;
@property (nonatomic, strong) FQPhotoAlbum      *photoAlbum;
@end

@implementation TakePhoneController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)choosePic:(id)sender {
    
    if (!_photoAlbum) {
        _photoAlbum = [[FQPhotoAlbum alloc] init];
    }
    // 调用getPhotoAlbumOrTakeAPhotoWithController方法
    [_photoAlbum getPhotoAlbumOrTakeAPhotoWithController:self andWithBlock:^(UIImage *image) {
        self.iv.image = image;
    }];
}

@end
