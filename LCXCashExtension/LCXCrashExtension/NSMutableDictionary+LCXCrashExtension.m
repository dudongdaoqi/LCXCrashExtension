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

#import "NSMutableDictionary+LCXCrashExtension.h"
#import "NSObject+LCXCrashExtension.h"

@implementation NSMutableDictionary (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryM") originMethodSel:@selector(setObject:forKey:) replaceMethodSel:@selector(lc_setObject:forKey:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSDictionaryM") originMethodSel:@selector(removeObjectForKey:) replaceMethodSel:@selector(lc_removeObjectForKey:)];
}

- (void)lc_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject && aKey) {
        [self lc_setObject:anObject forKey:aKey];
    }
}

- (void)lc_removeObjectForKey:(id)aKey{
    if (aKey) {
        [self lc_removeObjectForKey:aKey];
    }
}

@end
