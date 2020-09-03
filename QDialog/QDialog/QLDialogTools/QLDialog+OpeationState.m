//
//  QLDialog+OpeationState.m
//  QDialog
//
//  Created by 公智能 on 2020/9/2.
//  Copyright © 2020 Don. All rights reserved.
//

/**
 
 操作状态提示
 */
#import "QLDialog+OpeationState.h"
#import "WMZDialog.h"

@implementation QLDialog (OpeationState)
+(void)q_showWating:(NSString *)title{
     WMZDialog *alert = Dialog()
    //加载框颜色
    .wLoadingColorSet(DialogColor(0xFF9900))
    //无文字
    .wTitleSet(title)
    //毛玻璃背景
    .wEffectShowSet(YES)
    .wShadowCanTapSet(NO) //禁止背景点击事件
    .wTypeSet(DialogTypeLoading)
    //加载框type
    .wLoadingTypeSet(LoadingStyleWait)
    //动画时间
    .wAnimationDurtionSet(1)
    //加载框大小
    .wLoadingSizeSet(CGSizeMake(50, 50))
    .wStart();
    //自动消失
    [alert performSelector:@selector(closeView) withObject:nil afterDelay:2.5];
}
+(void)q_showCorrect:(NSString *)title{
    WMZDialog *alert =  Dialog()
    //加载框颜色
    .wLoadingColorSet(DialogColor(0x108ee9))
    .wTitleSet(title)
    //毛玻璃背景
    .wEffectShowSet(YES)
    .wShadowCanTapSet(NO) //禁止背景点击事件
    .wTypeSet(DialogTypeLoading)
    //加载框type
    .wLoadingTypeSet(LoadingStyleRight)
    //动画时间
    .wAnimationDurtionSet(1)
    //加载框大小
    .wLoadingSizeSet(CGSizeMake(50, 50))
    .wStart();
    //自动消失
    [alert performSelector:@selector(closeView) withObject:nil afterDelay:2.5];
}
+(void)q_showFault:(NSString *)title{
    WMZDialog *alert =
    Dialog()
    //加载框颜色
    .wLoadingColorSet([UIColor redColor])
    .wTitleSet(title)
    //毛玻璃背景
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
