//
//  QLDialog+OpeationState.h
//  QDialog
//
//  Created by 公智能 on 2020/9/2.
//  Copyright © 2020 Don. All rights reserved.
//

#import "QLDialog.h"

NS_ASSUME_NONNULL_BEGIN

@interface QLDialog (OpeationState)
/*
 操作等待中。。
 */
+(void)q_showWating:(NSString *)title;
/*
 操作完成或者正确
 */
+(void)q_showCorrect:(NSString *)title;
/*
 操作失败
 */
+(void)q_showFault:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
