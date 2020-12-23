//
//  JIheOne_view.m
//  QDialog
//
//  Created by 公智能 on 2020/10/21.
//  Copyright © 2020 Don. All rights reserved.
//

#import "JIheOne_view.h"

@implementation JIheOne_view


- (void)drawRect:(CGRect)rect {
    UIBezierPath *path;
    CGRect remainder;
    CGRect slice;
    
    //左侧橙色部分
    CGRectDivide(rect, &slice, &remainder, 80, CGRectMinXEdge);// CGRectMinXEdge：取左边
    [[UIColor orangeColor] set];
    path = [UIBezierPath bezierPathWithRect:slice];
    [path fill];
    
    rect = remainder;
    CGRectDivide(rect, &slice, &remainder, remainder.size.height*0.5, CGRectMinYEdge);
    [[UIColor purpleColor] set];
    path = [UIBezierPath bezierPathWithRect:slice];
    [path fill];
}


@end
