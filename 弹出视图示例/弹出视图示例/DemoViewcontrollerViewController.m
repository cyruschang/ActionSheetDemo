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
@interface DemoViewcontrollerViewController ()<CsActionSheetDelegate>
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
    CsActionSheet *sheet = [[CsActionSheet alloc] initWithArray:@[@"交易记录", @"支付管理", @"支付安全", @"帮助中心", @"魔兽世界", @"斗战神"] andCancelString:@"取消"];
    sheet.delegate = self;
    [sheet show];
}


/*
- (UIView *)createView {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *background = [[UIView alloc] initWithFrame:window.bounds];
    background.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [background addGestureRecognizer:tap];
    background.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    UIView *menu = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, 222)];
    menu.backgroundColor = [UIColor whiteColor];
    [background addSubview:menu];
    
    
    self.backgroundView = background;
    self.menuView = menu;
    return background;
}
 */

/*
- (void)showMenu {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    UIView *menu = [self createView];
    [window addSubview:menu];

    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        CGRect frame = CGRectMake(0, ScreenH - 222, ScreenW, 222);
        self.menuView.frame = frame;
    }];
    
    //NSLog(NSStringFromCGRect(window.bounds));
}
 */

/*
- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        self.menuView.frame = CGRectMake(0, ScreenH, ScreenW, 222);
    } completion:^(BOOL finished) {
        [self.backgroundView removeFromSuperview];
    }];
    
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)CsActionSheet:(CsActionSheet *)sheet clickedButtonAtIndex:(int)index {
    NSLog(@"点击了第%d个按钮", index);
}
@end
