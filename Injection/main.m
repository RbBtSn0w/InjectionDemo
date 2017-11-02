//
//  main.m
//  Injection
//
//  Created by Snow.y.wu on 11/2/17.
//  Copyright © 2017 rbbtsn0w. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Train.h"
#import "Sedan.h"
#import "Car.h"
#import "InjectionProxy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        Train *train = [[Train alloc] init];
        Sedan *sedan = [[Sedan alloc] init];
        
        NSProxy<Car,InjectionProxy> *carProxy = [InjectionProxy alloc];
        
        [carProxy injectDependencyObject:train forProtocol:@protocol(Car)];
        [carProxy didi];
        
        [carProxy injectDependencyObject:sedan forProtocol:@protocol(Car)];
        [carProxy didi];
        
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
