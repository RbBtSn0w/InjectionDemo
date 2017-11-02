//
//  InjectionProxy.m
//  Injection
//
//  Created by Snow.y.wu on 11/2/17.
//  Copyright © 2017 rbbtsn0w. All rights reserved.
//

#import "InjectionProxy.h"


@implementation InjectionProxy

- (NSMutableDictionary *)implementions{
    if (!_implementions) {
        _implementions = [NSMutableDictionary dictionary];
    }
    return _implementions;
}

- (void)injectDependencyObject:(nonnull id)object forProtocol:(nonnull Protocol *)protocol {
    NSParameterAssert(object && protocol);
    NSAssert([object conformsToProtocol:protocol], @"objct %@ does't conform to protocol: %@", object, protocol);
    self.implementions[NSStringFromProtocol(protocol)] = object;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    for (id object in self.implementions.allValues) {
        if ([object respondsToSelector:sel]) {
            return [object methodSignatureForSelector:sel];
        }
    }
    return [super methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {

    for (id object in self.implementions.allValues) {
        if ([object respondsToSelector:invocation.selector]) {
            [invocation invokeWithTarget:object];
            return;
        }
    }
    [super forwardInvocation:invocation];
}
@end
