//
//  TimerViewController.m
//  JJCountdown
//
//  Created by 徐沈俊杰 on 2017/3/6.
//  Copyright © 2017年 XYBS. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (strong, nonatomic) IBOutlet UIButton *countDownBtn;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)countDownTimerPressed:(id)sender {
    [self countDownTimerWithText:self.countDownBtn.titleLabel.text Flag:YES AndTime:@"5"];
}

#pragma mark - Method
- (void)countDownTimerWithText:(NSString *)btnText Flag:(BOOL)isBegin AndTime:(NSString *)time{
    NSString *title = [self.countDownBtn titleForState:UIControlStateDisabled];
    NSString *subStr = title;
    if (isBegin) {
        subStr = [title stringByReplacingOccurrencesOfString:btnText withString:[NSString stringWithFormat:@"%@s", time]];
        isBegin = NO;
        self.countDownBtn.enabled = NO;
    }
    subStr = [subStr stringByReplacingOccurrencesOfString:@"s" withString:@""];
    NSInteger count = [subStr integerValue];
    if (count <= 0) {
        isBegin = YES;
        self.countDownBtn.enabled = YES;
        [self.countDownBtn setTitle:btnText forState:UIControlStateDisabled];
    } else {
        NSString *titleNew = [NSString stringWithFormat:@"%lds", count - 1];
        [self.countDownBtn setTitle:titleNew forState:UIControlStateDisabled];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self countDownTimerWithText:btnText Flag:NO AndTime:nil];
        });
    }
}

@end
