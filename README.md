# LCXCrashExtension

[![Version](https://img.shields.io/cocoapods/v/LCXCrashExtension.svg?style=flat)](http://cocoapods.org/pods/LCXCrashExtension)
[![License](https://img.shields.io/cocoapods/l/LCXCrashExtension.svg?style=flat)](http://cocoapods.org/pods/LCXCrashExtension)
[![Platform](https://img.shields.io/cocoapods/p/LCXCrashExtension.svg?style=flat)](http://cocoapods.org/pods/LCXCrashExtension)

LCXCashExtension is the last defender of your code, protect your code to crash.

Installation
==============

### CocoaPods

1. Add `pod 'LCXCrashExtension'` to your Podfile.
2. Run `pod install` or `pod update`.
3. If you just protect you from crash, you don't need to include any header.
   If you want to safely check, Import \<LCXCrashExtension.h\>.

Requirements
==============
This library requires `iOS 8.0+` and `Xcode 8.0+`.

License
==============
LCXCrashExtension is provided under the MIT license. See LICENSE file for details.

How To Use
----------
the crash part，don't need to import. All of them will not crash, as below.

```objective-c

   NSArray *arrayRang = [[NSArray alloc]initWithObjects:@"1", nil];
  [arrayRang objectAtIndex:6];

  NSMutableDictionary *tempDict = [NSMutableDictionary new];
  [tempDict setObject:nil forKey:@"1"];

  NSArray *array = [NSArray new];
  [array objectAtIndex:0];
  NSDictionary *dict = (NSDictionary *)array;
  NSLog(@"%@",dict.allKeys);

```

the protect part，Import \<LCXCrashExtension.h\>, use just like this

```objective-c

  NSString *stringValue = (NSString *)[NSDictionary new];
  if ([stringValue isValueString]) {
  NSLog(@"success");
  }else{
  NSLog(@"fail");
  }

```
