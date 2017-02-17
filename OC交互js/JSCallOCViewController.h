//
//  JSCallOCViewController.h
//  OC交互js
//
//  Created by 毛毛 on 2017/2/17.
//  Copyright © 2017年 锐拓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol TestJSExport <JSExport>

JSExportAs(calculateForJS/** handleFactorialCalculateWithNumber 作为js方法的别名 */,
- (void)handleFactorialCalculateWithNumber:(NSNumber *)number
);
- (void)pushViewController:(NSString *)view title:(NSString *)title;
@end
@interface JSCallOCViewController : UIViewController<UIWebViewDelegate,TestJSExport>

@end
