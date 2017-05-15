// The MIT License (MIT)
//
// Copyright (c) 2016-2017 dudongdaoqi ( https://github.com/dudongdaoqi )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "NSObject+LCXCrashExtension.h"
#import <objc/runtime.h>

@implementation NSObject (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(addObserver:forKeyPath:options:context:) replaceMethodSel:@selector(lc_addObserver:forKeyPath:options:context:)];
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(removeObserver:forKeyPath:) replaceMethodSel:@selector(lc_removeObserver:forKeyPath:)];
}

- (void) lc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    if (observer && keyPath) {
        @try {
            [self lc_addObserver:observer forKeyPath:keyPath options:options context:context];
        }@catch (NSException *exception) {
        }
    }
}

- (void) lc_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    if (observer && keyPath) {
        @try {
            [self lc_removeObserver:observer forKeyPath:keyPath];
        }@catch (NSException *exception) {
        }
    }
}

- (void)exchangeInstanceMethod:(Class)anClass originMethodSel:(SEL)originSEL replaceMethodSel:(SEL)replaceSEL{
    Method origIndex3 = class_getInstanceMethod(anClass, originSEL);
    Method overrideIndex3 = class_getInstanceMethod(anClass, replaceSEL);
    if (!origIndex3 || !overrideIndex3) {
        return;
    }
    method_exchangeImplementations(origIndex3, overrideIndex3);
}


@end
