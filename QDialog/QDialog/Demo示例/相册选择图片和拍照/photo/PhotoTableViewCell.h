//
//  PhotoTableViewCell.h
//  QDialog
//
//  Created by 公智能 on 2021/2/25.
//  Copyright © 2021 Don. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^PhotoBlock)(NSMutableArray *images);

@interface PhotoTableViewCell : UITableViewCell
//如果只是显示图片，则传入一下数组
@property(nonatomic,strong)NSArray *showImgArr;
@property(nonatomic,strong)UILabel *leftTitle;
@property(nonatomic,copy)PhotoBlock photoBlock;


@end

NS_ASSUME_NONNULL_END
