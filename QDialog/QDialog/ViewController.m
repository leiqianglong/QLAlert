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
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[HomeDemoVc new]];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

//相册选择图片和拍照
- (IBAction)chooseImageAndTakePhone:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[TakePhoneController new]];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)progress:(id)sender {
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[DiscreteController new]];
     nav.modalPresentationStyle = UIModalPresentationFullScreen;
     [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)mutipleChooseImages:(id)sender {
    

}

@end
