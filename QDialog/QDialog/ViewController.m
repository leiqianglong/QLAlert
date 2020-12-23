//
//  ViewController.m
//  QDialog
//
//  Created by 公智能 on 2020/9/2.
//  Copyright © 2020 Don. All rights reserved.
//

#import "ViewController.h"
#import "HomeDemoVc.h"
#import "QLDialog.h"
#import "WMZDialog.h"
#import "QLDialog+QLPayDailog.h"
#import "QLDialog+OpeationState.h"
#import "QLDialog+Toast.h"
#import "TakePhoneController.h"
#import "DiscreteController.h"
#import "MutilTakePhViewController.h"
#import "FaceIDViewController.h"
#import "ExhibitionCtr.h"
#import "DrawViewController.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

/// 模拟微信支付
- (IBAction)showlog:(id)sender {
    
    WMZDialog * dl = [QLDialog q_ShowPayLoading:@"支付中..."];
    //模拟支付过程
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dl closeView];
        int x = arc4random() % 10;
        if (x %2 == 0) {
            [QLDialog q_ShowSucess:@"支付成功"];
        }else{
            [QLDialog q_ShowError:@"支付失败"];
        }
    });
}

/// 操作状态提示
- (IBAction)operationState:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [QLDialog q_showWating:@"加载中..."];
            break;
        case 1:
            [QLDialog q_showCorrect:@"加载完成"];
            break;
        case 2:
            [QLDialog q_showFault:@"加载失败"];
            break;
        default:
            break;
    }
}

//toast操作
- (IBAction)toastOperation:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [QLDialog q_ShowToast:@"自动2.3s后提示消失"];
            break;
        case 1:
            [QLDialog q_ShowToast:@"自动消失带图片" img:@"down_tyx" imgWidth:140];
            break;
        case 2:
           [QLDialog q_ShowToast:@"" img:@"down_tyx" imgWidth:100];
            break;
        default:
            break;
    }
}
//demo示例
- (IBAction)demoshili:(id)sender {
    [self presentVc:[HomeDemoVc new]];
}

//相册选择图片和拍照
- (IBAction)chooseImageAndTakePhone:(id)sender {
    [self presentVc:[TakePhoneController new]];
}

- (IBAction)progress:(id)sender {
    [self presentVc:[DiscreteController new]];
}
- (IBAction)mutipleChooseImages:(id)sender {
    [self presentVc:[MutilTakePhViewController new]];
}
- (IBAction)faceidClick:(id)sender {
    [self presentVc:[FaceIDViewController new]];
}
//加密算法
- (IBAction)ExhibitionClick:(id)sender {
    [self presentVc:[ExhibitionCtr new]];
}

- (IBAction)DrawClick:(id)sender {
    [self presentVc:[DrawViewController new]];

}
- (IBAction)imageCompress:(id)sender {
    
    UIImage *img = [UIImage imageNamed:@"miao.jpeg"];
    NSData *imgData = [self compressImage:img toByte:1000*500];
    NSString *savedImagePath = @"/Users/gongzhineng/Desktop/234.png";
    [imgData writeToFile:savedImagePath atomically:YES];
}

-(void)presentVc:(UIViewController *)vc{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 压缩图片
-(NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength{
    // Compress by quality
    //重新绘制图片  防止ios11上出现 UIImageJPEGRepresentation 返回为nil的情况
    image = [self scaleImage:image];
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    
//    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    
    if (data.length < maxLength) {
        data = [self getImageData:resultImage cp:compression];
        return data;
    }
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        data = [self getImageData:resultImage cp:compression];;
    }
    return data;
}
-(NSData *)getImageData:(UIImage *)resultImage cp:(CGFloat)compression{
    CGFloat ratio = 0;
    if (resultImage.size.width > 500.0) {
        if (resultImage.size.width >= 500.0 && resultImage.size.width < 1000.0) {
            ratio = 0.5;
        }else if (resultImage.size.width >= 1000.0 && resultImage.size.width < 1500.0){
            ratio = 0.3;
        }else if (resultImage.size.width >= 1500.0 && resultImage.size.width < 2000.0){
            ratio = 0.25;
        }else if (resultImage.size.width >= 2000.0 && resultImage.size.width < 3000.0){
            ratio = 0.2;
        }else if (resultImage.size.width >= 3000.0){
            ratio = 0.15;
        }else{
            ratio = 0.1;
        }
    }else{
        ratio = 1.0;
    }
    CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * ratio),
                             (NSUInteger)(resultImage.size.height * ratio));
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  UIImageJPEGRepresentation(resultImage, compression);
}

//重绘图片
- (UIImage *)scaleImage:(UIImage *)image{
    //确定压缩后的size
    CGFloat scaleWidth = image.size.width;
    CGFloat scaleHeight = image.size.height;
    CGSize scaleSize = CGSizeMake(scaleWidth, scaleHeight);
    //开启图形上下文
    UIGraphicsBeginImageContext(scaleSize);
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    //从图形上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}

@end
