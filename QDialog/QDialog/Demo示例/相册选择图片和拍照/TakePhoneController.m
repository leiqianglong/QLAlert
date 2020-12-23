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
        UIImage *iimm = [self imageWithimage:image name:@"王明" time:@"2020-12-12 12:22:22" address:@"西安市雁塔区科技二路清华科技园" frame:CGRectMake(20, 15, self.view.frame.size.width, 26)];
        self.iv.image = iimm;
    }];
}


//姓名：  确认时间：地址：
- (UIImage *)imageWithimage:(UIImage *)image name:(NSString *)name time:(NSString *)time address:(NSString *)address frame:(CGRect)frame{
    // 开启图形'上下文'
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 绘制原生图片
    [image drawAtPoint:CGPointZero];
    // 创建文字属性字典
    NSDictionary *dictionary = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:20]};
    // 绘制文字属性
    NSString *s1 = [NSString stringWithFormat:@"姓   名:%@",name];
    NSString *s2 = [NSString stringWithFormat:@"确认时间:%@",time];
    NSString *s3 = [NSString stringWithFormat:@"地   址:%@",address];
    [s1 drawInRect:frame withAttributes:dictionary];
    CGRect r1 = CGRectMake(20, CGRectGetMaxY(frame) + 8, frame.size.width, frame.size.height);
    [s2 drawInRect:r1 withAttributes:dictionary];
    CGRect r2 = CGRectMake(20, CGRectGetMaxY(r1) + 8, frame.size.width, frame.size.height);
    [s3 drawInRect:r2 withAttributes:dictionary];
    // 从当前上下文获取修改后的图片
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图形上下文
    UIGraphicsEndImageContext();
    return imageNew;
}



@end
