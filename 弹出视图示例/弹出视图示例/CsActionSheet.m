//
//  CsActionSheet.m
//  弹出视图示例
//
//  Created by Cyrus on 16/3/14.
//  Copyright © 2016年 ZuoShou. All rights reserved.
//

#import "CsActionSheet.h"
@interface CsActionSheet()<CsActionSheetDelegate>
@property (nonatomic, weak  ) UIView   *menuView;
@property (nonatomic, assign) CGFloat  menuHeight;
@property (nonatomic, strong) NSArray  *menuStrings;
@property (nonatomic, copy  ) NSString *cancelString;
@property (nonatomic, copy  ) NSString *title;
@end
@implementation CsActionSheet
#define ScreenW [[UIScreen mainScreen] bounds].size.width
#define ScreenH [[UIScreen mainScreen] bounds].size.height
#define kIndex 100
- (instancetype)initWithArray:(NSArray *)strings andCancelString:(NSString *)cancelString andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        self.frame = window.bounds;
        self.menuStrings = strings;
        self.cancelString = cancelString;
        self.title = title;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
        [self setup];
    }
    return self;
}

- (void)setup {
    CGFloat height;
    
    // 断言，也就是确保
    NSAssert(self.menuStrings.count != 0, @"菜单的数量不能为零");
    
    
    UIView *menu = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH, ScreenW, height)];
    menu.backgroundColor = [UIColor lightGrayColor];
    
    menu.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(blankTouch:)];
    [menu addGestureRecognizer:tap];
    
    
    UILabel *titleView;
    if (!self.title) {
        // 如果标题是空的话，就不用标题
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    } else {
        titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
        titleView.text = self.title;
        titleView.textAlignment = NSTextAlignmentCenter;
        titleView.backgroundColor = [UIColor whiteColor];
        titleView.textColor = [UIColor lightGrayColor];
        [menu addSubview:titleView];
    }
    
    
    if (self.title) {
        height = 44 * self.menuStrings.count + 5 + 44 + 50; // 50 是标题的高度
    } else {
        height = 44 * self.menuStrings.count + 5 + 44;
    }
    
    
    for (int i = 0; i < self.menuStrings.count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame) + 44 * i, ScreenW, 44)];
        [button setTitle:self.menuStrings[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setHighlighted:YES];
        
        button.tag = kIndex + i + 1;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [menu addSubview:button];
        
        // 分割线
        if (i != 0) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame) +  44 * i, ScreenW, 0.5)];
            line.backgroundColor = [UIColor lightGrayColor];
            [menu addSubview:line];
        }
    }
    
    if (self.title) {
        UIView *upline = [[UIView alloc] initWithFrame:CGRectMake(0, 54.5, ScreenW, 0.5)];
        upline.backgroundColor = [UIColor lightGrayColor];
        [menu addSubview:upline];
        [menu bringSubviewToFront:upline];
    }
    
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, height - 44, ScreenW, 44)];
    cancel.tag = 100;
    
    [cancel setTitle:self.cancelString forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel setBackgroundColor:[UIColor whiteColor]];
    [cancel addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [menu addSubview:cancel];
    self.menuView = menu;
    self.menuHeight = height;
    
    [self addSubview:menu];
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.menuView.frame = CGRectMake(0, ScreenH - self.menuHeight, ScreenW, self.menuHeight);
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        self.menuView.frame = CGRectMake(0, ScreenH, ScreenW, self.menuHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)buttonClicked:(UIButton *)button {
    [self dismiss];
    int index = (int)button.tag - kIndex;
    if ([self.delegate respondsToSelector:@selector(CsActionSheet:clickedButtonAtIndex:)]) {
        // 直接调用，不然用代理无法传递int类型值
        [self.delegate CsActionSheet:self clickedButtonAtIndex:index];
    }
}

- (void)setCallBack:(ActionSheetCallBack)callBack {
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (ActionSheetCallBack)callBack {
    return objc_getAssociatedObject(self, @selector(callBack));
}

- (void)CsActionSheet:(CsActionSheet *)sheet clickedButtonAtIndex:(int)index {
    if (self.callBack) {
        self.callBack(sheet, index);
    }
}


- (void)blankTouch:(UITapGestureRecognizer *)tap {
    NSLog(@"点击了灰色上方的空白处");
}

@end
