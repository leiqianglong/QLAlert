//
//  QLDialog+QLPayDailog.m
//  QDialog
//
//  Created by 公智能 on 2020/9/2.
//  Copyright © 2020 Don. All rights reserved.
//

#import "QLDialog+QLPayDailog.h"

@implementation QLDialog (QLPayDailog)
+(WMZDialog *)q_ShowPayLoading:(NSString *)title{
    return  Dialog()
    //加载框颜色
    .wLoadingColorSet(DialogColor(0xFF9900))
    //无文字
    .wTitleSet(title)
    //毛玻璃背景
    .wEffectShowSet(YES)
    //遮罩层能否点击
    .wShadowCanTapSet(NO)
    .wTypeSet(DialogTypeLoading)
    //加载框type
    .wLoadingTypeSet(LoadingStyleWait)
    //动画时间
    .wAnimationDurtionSet(1)
    //加载框大小
    .wLoadingSizeSet(CGSizeMake(50, 50))
    .wStart();
}

+(void)q_ShowSucess:(NSString *)title{
    WMZDialog * dl2 =Dialog()
    //加载框颜色
    .wLoadingColorSet(DialogColor(0x108ee9))
    .wTitleSet(title)
    //毛玻璃背景
    .wEffectShowSet(YES)
    //遮罩层能否点击
    .wShadowCanTapSet(NO)
    .wTypeSet(DialogTypeLoading)
    //加载框type
    .wLoadingTypeSet(LoadingStyleRight)
    //动画时间
    .wAnimationDurtionSet(1)
    //加载框大小
    .wLoadingSizeSet(CGSizeMake(50, 50))
    .wStart();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [dl2 closeView];
     });
}
+(void)q_ShowError:(NSString *)title{
    WMZDialog *alert =
    Dialog()
    //加载框颜色
    .wLoadingColorSet([UIColor redColor])
    .wTitleSet(title)
    //毛玻璃背景
    .wEffectShowSet(YES)
    //遮罩层能否点击
    .wShadowCanTapSet(NO)
    .wTypeSet(DialogTypeLoading)
    //加载框type
    .wLoadingTypeSet(LoadingStyleError)
    //动画时间
    .wAnimationDurtionSet(1)
    //加载框大小
    .wLoadingSizeSet(CGSizeMake(50, 50))
    .wStart();
    
    //自动消失
    [alert performSelector:@selector(closeView) withObject:nil afterDelay:2.5];
}
@end
