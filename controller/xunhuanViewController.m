//
//  xunhuanViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/12/18.
//  Copyright © 2018 ios. All rights reserved.
//

#import "xunhuanViewController.h"
#import <objc/runtime.h>

@interface xunhuanViewController ()
@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,strong) id  target;//控制器不持有 不用weak

@end

@implementation xunhuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _target = [NSObject new];
    class_addMethod([_target class], @selector(fire), (IMP)fireIMP, "v@:");
    
    //1 NStimer
    /*1 runloop 强引用nstimer 循环
      2 selt.timer 是target 的self 强引用，需要给 weakself。解决后 还是存在， 因为强引用
      3 核心，让timer 完全脱离self 利用runtime
      4
     */
    _timer= [NSTimer scheduledTimerWithTimeInterval:1 target:_target selector:@selector(fire) userInfo:nil repeats:YES];
}



- (void)didMoveToParentViewController:(UIViewController *)parent{
    if (parent ==nil) {
        [_timer invalidate];
        _timer = nil;
    }
    
}
void fireIMP(id self,SEL _cmd){
    
       NSLog(@"aaaa");
}

- (void)fire{
    
    NSLog(@"ddddd");
}


- (void)dealloc{
    
    NSLog(@"dealloc");
    [_timer invalidate];
    _timer = nil;
}

@end
