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


#import "NSArray+LCXProtecteExtension.h"

@implementation NSArray (LCXProtecteExtension)

- (BOOL)isValueArray{
    if (self && [self isKindOfClass:[NSArray class]]) {
        return YES;
    }else{
        return NO;
    }
}

- (id)parseObjectAtIndex:(NSInteger)index className:(NSString *)name{
    if ([self isKindOfClass:[NSArray class]] && (self.count > index)) {
        id object = [self objectAtIndex:index];
        if (object && [object isKindOfClass:[NSClassFromString(name) class]]) {
            return object;
        }
    }
    return nil;
}

- (id)parseTableSection:(NSInteger)section row:(NSInteger)row className:(NSString *)name{
    if (self && [self isKindOfClass:[NSArray class]]) {
        if (self.count > section) {
            id object = [self objectAtIndex:section];
            if (object && [object isKindOfClass:[NSArray class]]) {
                NSArray *array = (NSArray *)object;
                if (array.count > row) {
                    id teo = [array objectAtIndex:row];
                    if (teo && [teo isKindOfClass:[NSClassFromString(name) class]]) {
                        return teo;
                    }
                }
            }
        }
    }
    return nil;
}

@end
