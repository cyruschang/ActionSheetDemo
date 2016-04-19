//
//  DemoViewcontrollerViewController.m
//  弹出视图示例
//
//  Created by Cyrus on 16/3/14.
//  Copyright © 2016年 ZuoShou. All rights reserved.
//

#import "DemoViewcontrollerViewController.h"
#import "CsActionSheet.h"
#define ScreenW [[UIScreen mainScreen] bounds].size.width
#define ScreenH [[UIScreen mainScreen] bounds].size.height
@interface DemoViewcontrollerViewController ()
//@property (nonatomic, strong) UIView *backgroundView;
//@property (nonatomic, strong) UIView *menuView;
@end

@implementation DemoViewcontrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"示例";
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(showMenu)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenu {
    CsActionSheet *sheet = [[CsActionSheet alloc] initWithArray:@[@"交易记录", @"支付管理", @"支付安全", @"帮助中心", @"魔兽世界", @"斗战神"] andCancelString:@"取消" andTitle:@"如果删除了，就不会有了"];
    //    sheet.delegate = self;
    sheet.callBack = ^(CsActionSheet *sheet, int index) {
        NSLog(@"点击了第%d个按钮", index);
    };
    [sheet show];
}


/*
 - (void)CsActionSheet:(CsActionSheet *)sheet clickedButtonAtIndex:(int)index {
 NSLog(@"点击了第%d个按钮", index);
 }
 */
@end
