//
//  NdUncaughtExceptionHandler.m
//  
//
//  Created by Static Ga on 13-7-15.
//

#import "NdUncaughtExceptionHandler.h"

NSString *applicationDocumentsDirectory() {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
    
}

void UncaughtExceptionHandler(NSException *exception) {
    
    NSArray *arr = [exception callStackSymbols];
    
    NSString *reason = [exception reason];
    
    NSString *name = [exception name];
    
    
    
    NSString *url = [NSString stringWithFormat:@"=============异常崩溃报告=============\nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@",
                     
                     name,reason,[arr componentsJoinedByString:@"\n"]];
    NSString *path = [applicationDocumentsDirectory() stringByAppendingPathComponent:@"CashLog.txt"];
    NSLog(@"Crash Path %@",path);
    [url writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //除了可以选择写到应用下的某个文件，通过后续处理将信息发送到服务器等
    
    //还可以选择调用发送邮件的的程序，发送信息到指定的邮件地址
    
    //或者调用某个处理程序来处理这个信息
    
}
@implementation NdUncaughtExceptionHandler

-(NSString *)applicationDocumentsDirectory {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
}

+ (void)setDefaultHandler
{
    NSSetUncaughtExceptionHandler (&UncaughtExceptionHandler);
}

+ (NSUncaughtExceptionHandler*)getHandler

{
    return NSGetUncaughtExceptionHandler();
}
@end
