//
//  PGGCryptoMD5.h
//  PGGCrypto
//
//  Created by 陈鹏 on 2017/10/24.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//  GitHub地址  https://github.com/penghero/PGGCrypto.git


/**
 鹏哥哥MD5加密
 MD5的作用是让大容量信息在用数字签名软件签署私人密钥前被"压缩"成一种保密的格式（就是把一个任意长度的字节串变换成一定长的十六进制数字串）。
 全写： Message Digest Algorithm MD5（中文名为消息摘要算法第五版）
 输出： 128bit
 特点：
 1、压缩性：任意长度的数据，算出的MD5值长度都是固定的。
 2、容易计算：从原数据计算出MD5值很容易。
 3、抗修改性：对原数据进行任何改动，哪怕只修改1个字节，所得到的MD5值都有很大区别。
 4、弱抗碰撞：已知原数据和其MD5值，想找到一个具有相同MD5值的数据（即伪造数据）是非常困难的。
 5、强抗碰撞：想找到两个不同的数据，使它们具有相同的MD5值，是非常困难的。
 缺陷：Md5一度被认为十分靠谱。2004年8月17日的美国加州圣巴巴拉的国际密码学会议（Crypto’2004）上，来自中国山东大学的王小云教授做了破译MD5、HAVAL-128、 MD4和RIPEMD算法的报告，公布了MD系列算法的破解结果。2009年，冯登国、谢涛二人利用差分攻击，将MD5的碰撞算法复杂度从王小云的2^42进一步降低到2^21，极端情况下甚至可以降低至2^10。仅仅2^21的复杂度意味着即便是在2008年的计算机上，也只要几秒便可以找到一对碰撞。Md5已老， 在安全性要求较高的场合，不建议使用。
 
 */
#import "HeaderPch.h"

@interface PGGCryptoMD5 : NSObject

/**
 类方法调用
 *该加密是调用官方自带加密算法 其为不可逆加密 可对同一字符串进行多次MD5加密
 @param input 输入的字符串
 @return           加密后输出
 */
+ (NSString *) pggMD5:(NSString *) input;

@end
