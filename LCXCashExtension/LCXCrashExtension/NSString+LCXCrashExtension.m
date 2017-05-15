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

#import "NSString+LCXCrashExtension.h"
#import "NSObject+LCXCrashExtension.h"

@implementation NSString (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:NSClassFromString(@"NSPlaceholderString") originMethodSel:@selector(initWithString:) replaceMethodSel:@selector(lc_initWithString:)];
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(substringFromIndex:) replaceMethodSel:@selector(lc_substringFromIndex:)];
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(substringToIndex:) replaceMethodSel:@selector(lc_substringToIndex:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSCFConstantString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_cons_substringWithRange:)];
    [self exchangeInstanceMethod:NSClassFromString(@"NSTaggedPointerString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_tag_substringWithRange:)];
    [self exchangeInstanceMethod:NSClassFromString(@"__NSCFString") originMethodSel:@selector(substringWithRange:) replaceMethodSel:@selector(lc_cf_substringWithRange:)];
}

- (instancetype)lc_initWithString:(NSString *)aString;{
    if (aString) {
        return [self lc_initWithString:aString];
    }else{
        return [self lc_initWithString:@""];
    }
}

- (NSString *)lc_substringFromIndex:(NSUInteger)from{
    if (from <= self.length) {
        return [self lc_substringFromIndex:from];
    }else{
        return self;
    }
}

- (NSString *)lc_substringToIndex:(NSUInteger)to{
    if (to <= self.length) {
        return [self lc_substringToIndex:to];
    }else{
        return self;
    }
}

- (NSString *)lc_cons_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_cons_substringWithRange:range];
    }else{
        return self;
    }
}

- (NSString *)lc_tag_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_tag_substringWithRange:range];
    }else{
        return self;
    }
}

- (NSString *)lc_cf_substringWithRange:(NSRange)range{
    if (range.length <= self.length && (range.location + range.length <= self.length)) {
        return [self lc_cf_substringWithRange:range];
    }else{
        return self;
    }
}

@end
