//
//  HeaderPch.h
//  QDialog
//
//  Created by 公智能 on 2020/10/16.
//  Copyright © 2020 Don. All rights reserved.
//

#import <Foundation/Foundation.h>


#define PGGkey            @"PGGCRYPTOKEY1024" //key自行修改
#define PGGIv             @"PGGPASSWORD@1024" //偏移量自行修改


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>


NS_ASSUME_NONNULL_BEGIN

@interface HeaderPch : NSObject

@end

NS_ASSUME_NONNULL_END
