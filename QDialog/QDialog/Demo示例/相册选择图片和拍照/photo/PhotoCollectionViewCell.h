//
//  PhotoCollectionViewCell.h
//  QDialog
//
//  Created by 公智能 on 2021/2/25.
//  Copyright © 2021 Don. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *deleteBtn;

@end

NS_ASSUME_NONNULL_END
