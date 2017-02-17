//
//  OCCallJSViewController.m
//  OC交互js
//
//  Created by 毛毛 on 2017/2/17.
//  Copyright © 2017年 锐拓. All rights reserved.
//

#import "OCCallJSViewController.h"

@interface OCCallJSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLable;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) JSContext *context;
@end

@implementation OCCallJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"oc call js";
    self.context = [[JSContext alloc] init];
    [self.context evaluateScript:[self loadJsFile:@"test"]];
}
- (NSString *)loadJsFile:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
}

- (IBAction)sendToJS:(UIButton *)sender {
    NSNumber *inputNumber = [NSNumber numberWithInteger:[self.textField.text integerValue]];
    JSValue *function = [self.context objectForKeyedSubscript:@"factorial"];
    JSValue *result = [function callWithArguments:@[inputNumber]];
    self.showLable.text = [NSString stringWithFormat:@"%@", [result toNumber]];
}


@end
