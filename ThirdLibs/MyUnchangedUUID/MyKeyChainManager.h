//
//  MyKeyChainManager.h
//  twoclooZR
//
//  Created by 2cloo2 on 16/6/24.
//  Copyright © 2016年 wu qian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyKeyChainManager : NSObject
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
@end
