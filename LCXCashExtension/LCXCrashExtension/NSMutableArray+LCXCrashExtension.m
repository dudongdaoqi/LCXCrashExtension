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

#import "NSMutableArray+LCXCrashExtension.h"
#import "NSObject+LCXCrashExtension.h"

@implementation NSMutableArray (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(objectAtIndex:) replaceMethodSel:@selector(lc_objectAtIndexM:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(addObject:) replaceMethodSel:@selector(lc_addObject:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(insertObject:atIndex:) replaceMethodSel:@selector(lc_insertObject:atIndex:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(removeObjectAtIndex:) replaceMethodSel:@selector(lc_removeObjectAtIndex:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSArrayM") originMethodSel:@selector(replaceObjectAtIndex: withObject:) replaceMethodSel:@selector(lc_replaceObjectAtIndex: withObject:)];
}

- (id)lc_objectAtIndexM:(NSUInteger)index{
    if (self.count == 0) {
        return nil;
    }else if (index >= self.count) {
        return [self lastObject];
    }else{
        return [self lc_objectAtIndexM:index];
    }
}

- (void)lc_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject) {
        [self lc_insertObject:anObject atIndex:index];
    }
}

- (void)lc_addObject:(id)anObject{
    if (anObject) {
        [self lc_addObject:anObject];
    }
}

- (void)lc_removeObjectAtIndex:(NSUInteger)index{
    if (self.count > index) {
        [self lc_removeObjectAtIndex:index];
    }
}

- (void)lc_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (anObject && self.count > index) {
        [self lc_replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
