//
//  QLDialog+Toast.h
//  QDialog
//
//  Created by 公智能 on 2020/9/3.
//  Copyright © 2020 Don. All rights reserved.
//

#import "QLDialog.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLDialog (Toast)
/***
 toast文字提示
 */
+(void)q_ShowToast:(NSString *)title;
/**
 toast图文提示
 */
+(void)q_ShowToast:(NSString *)title img:(NSString *)imgName imgWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
