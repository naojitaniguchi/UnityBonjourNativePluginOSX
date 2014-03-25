//
//  BonjourServer.h
//  BonjourPlugin
//
//  Created by 谷口 直嗣 on 2014/03/24.
//  Copyright (c) 2014年 谷口 直嗣. All rights reserved.
//

#pragma once
#if defined( __APPLE_CC__)
#include <TargetConditionals.h>

#if (TARGET_OS_IPHONE_SIMULATOR) || (TARGET_OS_IPHONE) || (TARGET_IPHONE)
#else

#import <Cocoa/Cocoa.h>
#endif
#endif

@interface BonjourServer : NSObject<NSNetServiceDelegate>{
    NSNetService *netService;
}

+ (BonjourServer*)sharedManager ;
+ (id)allocWithZone:(NSZone *)zone ;
- (id)copyWithZone:(NSZone*)zone ;
- (id)retain ;
- (oneway void)release;
- (id)autorelease;

-(void)startService:(NSString*)type name:(NSString*)name port:(int)port domain:(NSString*)domain;
-(void)stopService;

@end
