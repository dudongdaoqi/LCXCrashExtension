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


#import <Foundation/Foundation.h>

@interface NSDictionary (LCXProtecteExtension)

/**
 is valid NSDictionary

 @return    yes or no
 */
- (BOOL)isValueDict;

/**
 parse NSDictionary in NSDictionary

 @param key  the key of the value
 @return     the NSDictionary value
 */
- (NSDictionary *)parseDictKey:(NSString *)key;

/**
 parse NSDictionary in NSDictionary
 
 @param key  the key of the value
 @return     the NSDictionary value, possible is nil
 */
- (NSArray *)parseArrayKey:(NSString *)key;

/**
 parse NSString in NSDictionary
 
 @param key  the key of the value
 @return     the NSDictionary value, possible is nil
 */
- (NSString *)parseStringKey:(NSString *)key;

/**
 parse any object in NSDictionary
 
 @param key  the key of the value
 @return     the value, possible is nil
 */
- (id)parseObjectKey:(NSString *)key;

@end
