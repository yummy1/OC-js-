//
//  JSC2ViewController.m
//  OC交互js
//
//  Created by 毛毛 on 2017/2/17.
//  Copyright © 2017年 锐拓. All rights reserved.
//

#import "JSCallOCUseURLViewController.h"

@interface JSCallOCUseURLViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation JSCallOCUseURLViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"拦截url的形式实现js与OC的交互";
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"urljs.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest:request];
}
#pragma mark 用于js调用清空OC的接口
- (void)clearOC
{
    self.password.text = @"";
    self.userName.text = @"";
}
#pragma mark 用于设置js同步到OC的接口
- (void)setName:(NSString *)name password:(NSString *)password
{
    self.userName.text = name;
    self.password.text = password;
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlStr = request.URL.absoluteString;
    //        对数据的进行处理
    if ([urlStr hasPrefix:@"youling0809://clearOC"]) {
        [self clearOC];
        return NO;
    }else if ([urlStr hasPrefix:@"youling0809://js_synchronization_to_oc"]){
        NSString *urlstrTemp = [[NSMutableString alloc] initWithFormat:urlStr,nil];
        //        去掉字符串的杂质
        urlstrTemp = [urlstrTemp stringByReplacingOccurrencesOfString:@"youling0809://js_synchronization_to_oc" withString:@""];
        //        将字符串分割成数组
        NSArray *array = [urlstrTemp componentsSeparatedByString:@"__________"];
        [self setName:array[0] password:array[1]];
        return NO;
    }
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

@end
