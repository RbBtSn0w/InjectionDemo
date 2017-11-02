//
//  InjectionProxy.h
//  Injection
//
//  Created by Snow.y.wu on 11/2/17.
//  Copyright © 2017 rbbtsn0w. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol InjectionProxy <NSObject>

- (void)injectDependencyObject:(nonnull id)object forProtocol:(nonnull Protocol *)protocol;

@end

@interface InjectionProxy : NSProxy <InjectionProxy>
@property (nonatomic, strong, nonnull) NSMutableDictionary *implementions;
@end
