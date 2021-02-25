//
//  PhotoCollectionViewCell.m
//  QDialog
//
//  Created by 公智能 on 2021/2/25.
//  Copyright © 2021 Don. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "Masonry.h"
@implementation PhotoCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    self.imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor whiteColor];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.left.bottom.equalTo(self.contentView);
    }];
    
    //删除按钮
    self.deleteBtn = [[UIButton alloc]init];
    self.deleteBtn.backgroundColor = [UIColor clearColor];
    [self.deleteBtn setImage:[UIImage imageNamed:@"deletaIcon"] forState:(UIControlStateNormal)];
    [self.contentView addSubview:self.deleteBtn];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView);
        make.width.height.mas_equalTo(30);
    }];
}
@end
