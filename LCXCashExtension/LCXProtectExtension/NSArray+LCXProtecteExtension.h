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

@interface NSArray (LCXProtecteExtension)

/**
 is valid NSArray
 是否为有效的数组
 
 @return        yes or no
 */
- (BOOL)isValueArray;

/**
 parse array
 解析出数组中第index个classname类型的对象
 
 @param index    the index of the array
 @param className     the class name of the object in array
 @return         a object
 */
- (id)parseObjectAtIndex:(NSInteger)index className:(NSString *)className;


/**
 parse like tableview datasource
 解析出类tableview数据源数组中，第section中row下的classname类型的对象

 @param section  section data array
 @param row      row data array
 @param className     the class name of the object in array
 @return         a object
 */
- (id)parseTableSection:(NSInteger)section row:(NSInteger)row className:(NSString *)className;

@end
