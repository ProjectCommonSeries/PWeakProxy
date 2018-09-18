//
//  ViewController2.m
//  PWeakProxyDemo
//
//  Created by Fmyz on 2018/9/18.
//  Copyright © 2018年 Fmyz. All rights reserved.
//

#import "ViewController2.h"
#import "PWeakProxy.h"

@interface ViewController2 ()

@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger count;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _count = 0;
    
    PWeakProxy *weakProxy = [PWeakProxy weakProxyForObject:self];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:weakProxy selector:@selector(toCount) userInfo:nil repeats:YES];
}

- (void)toCount {
    _count++;
    NSLog(@"count:%ld", (long)_count);
}

- (void)dealloc {
    if (_timer) {
        [_timer invalidate];
    }
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
