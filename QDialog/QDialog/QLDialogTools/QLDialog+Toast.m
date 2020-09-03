//
//  QLDialog+Toast.m
//  QDialog
//
//  Created by 公智能 on 2020/9/3.
//  Copyright © 2020 Don. All rights reserved.
//

#import "QLDialog+Toast.h"
#import "WMZDialog.h"
@implementation QLDialog (Toast)
+(void)q_ShowToast:(NSString *)title{
    Dialog().wTypeSet(DialogTypeAuto)
    .wMessageSet(title)
    //自动消失时间 默认1.5
    .wDisappelSecondSet(2) //消失时间 设置为2s
    .wStart();
}

+(void)q_ShowToast:(NSString *)title img:(NSString *)imgName imgWidth:(CGFloat)width{
    Dialog().wTypeSet(DialogTypeAuto)
    //设置宽度
    .wWidthSet(width)
    .wMessageSet(title)
    .wImageNameSet(imgName)
    .wStart();
}

@end
