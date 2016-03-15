//
//  CsActionSheet.h
//  弹出视图示例
//
//  Created by Cyrus on 16/3/14.
//  Copyright © 2016年 ZuoShou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CsActionSheet;
@protocol CsActionSheetDelegate <NSObject>

@required
- (void)CsActionSheet:(CsActionSheet *)sheet clickedButtonAtIndex:(int)index;

@end
@interface CsActionSheet : UIView
@property (nonatomic, weak) id<CsActionSheetDelegate>delegate;
- (instancetype)initWithArray:(NSArray *)strings andCancelString:(NSString *)cancelString;
- (void)show;
- (void)dismiss;
@end
