//
//  KViewController.m
//  QDialog
//
//  Created by 公智能 on 2020/10/16.
//  Copyright © 2020 Don. All rights reserved.
//

#import "KViewController.h"

@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(closeViewCtr)];
}

-(void)closeViewCtr{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
