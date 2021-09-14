/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

/// This code runs when the `DatadogTests` bundle is loaded into memory and tests start.
/// Reference: https://developer.apple.com/documentation/objectivec/nsobject/1418815-load
__attribute__((constructor)) static void initialize_FrameworkLoadHandler() {
    Class testsObserverClass = objc_getClass("DatadogTests.DatadogTestsObserver");
    SEL startObservingSelector = NSSelectorFromString(@"startObserving");
    NSMethodSignature *methodSignature = [testsObserverClass methodSignatureForSelector:startObservingSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:testsObserverClass];
    [invocation setSelector:startObservingSelector];
    [invocation invoke];
}
