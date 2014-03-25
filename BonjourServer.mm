//
//  BonjourServer.m
//  BonjourPlugin
//
//  Created by 谷口 直嗣 on 2014/03/24.
//  Copyright (c) 2014年 谷口 直嗣. All rights reserved.
//

#import "BonjourServer.h"

@implementation BonjourServer

static BonjourServer* sharedBonjourServer = nil;

+ (BonjourServer*)sharedManager {
	@synchronized(self) {
		if (sharedBonjourServer == nil) {
			sharedBonjourServer = [[self alloc] init];
		}
	}
	return sharedBonjourServer;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (sharedBonjourServer == nil) {
			sharedBonjourServer = [super allocWithZone:zone];
			return sharedBonjourServer;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone*)zone {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (id)retain {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

- (NSUInteger)retainCount {
	return UINT_MAX;  // 解放できないインスタンスを表すため unsigned int 値の最大値 UINT_MAX を返す
}

- (oneway void)release {
	// シングルトン状態を保持するため何もしない
}

- (id)autorelease {
	return self;  // シングルトン状態を保持するため何もせず self を返す
}

-(void)startService:(NSString*)type name:(NSString*)name port:(int)port domain:(NSString*)domain {
    NSLog(@"type is %@", type);
    NSLog(@"name is %@", name);
    NSLog(@"domain is %@", domain);
    NSLog(@"port is %d", port);
    netService = [[NSNetService alloc] initWithDomain:@"" type:type name:@"" port:port];
    netService.delegate = self;
    [netService publish];
}

-(void)stopService {
    [netService stop];
    [netService release];
    netService = nil;
}



@end
