//
//  ExhibitionControllerDetail.h
//  QDialog
//
//  Created by 公智能 on 2020/10/16.
//  Copyright © 2020 Don. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    PGGControllerStyleMD5 = 0,
    PGGControllerStyleSha1 = 1,
    PGGControllerStyleHMAC = 2,
    PGGControllerStyleHMAC_MD5 = 3,
    PGGControllerStyleAES = 4,
    PGGControllerStyleDES = 5,
    PGGControllerStyleRSA = 6
}PGGControllerStyle;
NS_ASSUME_NONNULL_BEGIN

@interface ExhibitionControllerDetail : UIViewController
@property (nonatomic,assign) NSInteger PGGControllerStyle;
@property (strong,nonatomic) NSString *pggTitle;
@property (strong, nonatomic) IBOutlet UITextField *needcrypto;
@property (strong, nonatomic) IBOutlet UITextView *showcrypto;
@property (strong, nonatomic) IBOutlet UITextField *decrypt;
@property (strong, nonatomic) IBOutlet UIButton *confirm;
@property (strong, nonatomic) IBOutlet UIButton *cancel;
@end

NS_ASSUME_NONNULL_END
