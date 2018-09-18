//
//  PWeakProxy.m
//  Fmyz
//
//  Created by Fmyz on 2018/9/4.
//  Copyright © 2018年 Fmyz. All rights reserved.
//

#import "PWeakProxy.h"

@interface PWeakProxy ()

@property (nonatomic, weak) id target;

@end

@implementation PWeakProxy

+ (instancetype)weakProxyForObject:(id)targetObject
{
    PWeakProxy *weakProxy = [PWeakProxy alloc];
    weakProxy.target = targetObject;
    return weakProxy;
}

- (id)forwardingTargetForSelector:(SEL)selector
{
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{    void *nullPointer = NULL;
    [invocation setReturnValue:&nullPointer];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

@end
