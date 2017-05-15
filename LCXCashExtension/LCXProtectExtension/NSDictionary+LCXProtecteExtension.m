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


#import "NSDictionary+LCXProtecteExtension.h"

@implementation NSDictionary (LCXProtecteExtension)

- (BOOL)isValueDict{
    if (self && [self isKindOfClass:[NSDictionary class]]) {
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)parseStringKey:(NSString *)key{
    if (!self || !key || ![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id temp = [self objectForKey:key];
    if (temp && [temp isKindOfClass:[NSString class]]) {
        NSString *backString = (NSString *)temp;
        return backString;
    }else if (temp && [temp isKindOfClass:[NSNumber class]]) {
        NSNumber *backString = (NSNumber *)temp;
        return [backString description];
    }else{
        return nil;
    }
}


- (NSArray *)parseArrayKey:(NSString *)key{
    if (!self || !key || ![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id temp = [self valueForKey:key];
    if (temp && [temp isKindOfClass:[NSArray class]]) {
        NSArray *backArray = (NSArray *)temp;
        return backArray;
    }else{
        return nil;
    }
}


- (NSDictionary *)parseDictKey:(NSString *)key{
    if (!self || !key || ![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id temp = [self objectForKey:key];
    if (temp && [temp isKindOfClass:[NSDictionary class]]) {
        NSDictionary *backDict = (NSDictionary *)temp;
        return backDict;
    }else{
        return nil;
    }
}

- (id)parseObjectKey:(NSString *)key{
    if (!self || !key || ![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    id temp = [self objectForKey:key];
    return temp;
}

@end
