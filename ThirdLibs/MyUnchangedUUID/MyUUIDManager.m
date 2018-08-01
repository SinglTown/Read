//
//  MyUUIDManager.m
//  twoclooZR
//
//  Created by 2cloo2 on 16/6/24.
//  Copyright © 2016年 wu qian. All rights reserved.
//

#import "MyUUIDManager.h"
#import "MyKeyChainManager.h"
#import "AnyeProject-Swift.h"
//存钥匙串的字段
static NSString *const KEY_IN_KEYCHAIN = @"com.anyeSwiftProject";

@implementation MyUUIDManager


+(void)saveUUID:(NSString *)uuid{
    if (uuid && uuid.length > 0) {
        [MyKeyChainManager save:KEY_IN_KEYCHAIN data:uuid];
    }
}
+(NSString *)getUUID{
    //先获取keychain里面的UUID字段，看是否存在
    NSString *uuid = (NSString *)[MyKeyChainManager load:KEY_IN_KEYCHAIN];
    //如果不存在则为首次获取UUID，所以获取保存。
    if (!uuid || uuid.length == 0) {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        uuid = [NSString stringWithFormat:@"%@", uuidString];
        [self saveUUID:uuid];
        CFRelease(puuid);
        CFRelease(uuidString);
    }
    return uuid;
}
+(void)deleteUUID{
    [MyKeyChainManager delete:KEY_IN_KEYCHAIN];
}

@end
