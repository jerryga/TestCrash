//
//  NdUncaughtExceptionHandler.h
//  
//
//  Created by Static Ga on 13-7-15.
//



@interface NdUncaughtExceptionHandler : NSObject

+ (void)setDefaultHandler;
+ (NSUncaughtExceptionHandler*)getHandler;

@end
