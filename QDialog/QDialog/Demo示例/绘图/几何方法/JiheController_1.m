//
//  JiheController_1.m
//  QDialog
//
//  Created by 公智能 on 2020/10/21.
//  Copyright © 2020 Don. All rights reserved.
//

#import "JiheController_1.h"
#import "JIheOne_view.h"
@interface JiheController_1 ()

@end

@implementation JiheController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JIheOne_view *vi = [[JIheOne_view alloc]initWithFrame:CGRectMake(40, 130, [UIScreen mainScreen].bounds.size.width-80, 300)];
    [self.view addSubview:vi];
}



@end
