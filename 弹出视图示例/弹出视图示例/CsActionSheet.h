//
//  CsActionSheet.h
//  弹出视图示例
//
//  Created by Cyrus on 16/3/14.
//  Copyright © 2016年 ZuoShou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>

@class CsActionSheet;

typedef void (^ActionSheetCallBack)(CsActionSheet *, int);

@protocol CsActionSheetDelegate <NSObject>

@required
- (void)CsActionSheet:(CsActionSheet *)sheet clickedButtonAtIndex:(int)index;

@end
@interface CsActionSheet : UIView
@property (nonatomic, copy) ActionSheetCallBack callBack;
@property (nonatomic, weak) id<CsActionSheetDelegate>delegate;
- (instancetype)initWithArray:(NSArray *)strings andCancelString:(NSString *)cancelString andTitle:(NSString *)title;
- (void)show;
- (void)dismiss;
@end
