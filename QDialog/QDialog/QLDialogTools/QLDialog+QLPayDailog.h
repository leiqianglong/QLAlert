//
//  QLDialog+QLPayDailog.h
//  QDialog
//
//  Created by 公智能 on 2020/9/2.
//  Copyright © 2020 Don. All rights reserved.
//

/****
 此分类是应用于支付类提示
 */
#import "QLDialog.h"
#import "WMZDialog.h"
NS_ASSUME_NONNULL_BEGIN

@interface QLDialog (QLPayDailog)

+(WMZDialog *)q_ShowPayLoading:(NSString *)title;
+(void)q_ShowSucess:(NSString *)title;
+(void)q_ShowError:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
