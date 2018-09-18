//
//  PWeakProxy.h
//  Fmyz
//
//  Created by Fmyz on 2018/9/4.
//  Copyright © 2018年 Fmyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PWeakProxy : NSProxy

+ (instancetype)weakProxyForObject:(id)targetObject;

@end
