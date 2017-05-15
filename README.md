# LCXCrashExtension


LCXCashExtension is the last defender of your code, protect your code to crash.


like this，will no crash：
----------

```objective-c
    NSMutableArray *marray = [NSMutableArray new];
    [marray objectAtIndex:1];
    [marray addObject:nil];
    [marray insertObject:nil atIndex:0];
    [marray removeObjectAtIndex:2];
    [marray replaceObjectAtIndex:3 withObject:@"1"];
    [marray replaceObjectAtIndex:1 withObject:nil];
```

```objective-c
     NSMutableDictionary *tempDict = [NSMutableDictionary new];
    [tempDict setObject:nil forKey:@"1"];
    [tempDict removeObjectForKey:@"2"];
    [tempDict removeObjectForKey:nil];
```

```objective-c
    NSMutableArray *marray = [NSMutableArray new];
    [marray objectAtIndex:1];
    [marray addObject:nil];
    [marray insertObject:nil atIndex:0];
    [marray removeObjectAtIndex:2];
    [marray replaceObjectAtIndex:3 withObject:@"1"];
    [marray replaceObjectAtIndex:1 withObject:nil];

```

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

recommend this：
----------

```objective-c

  NSString *stringValue = (NSString *)[NSDictionary new];
  if ([stringValue isValueString]) {
  NSLog(@"success");
  }else{
  NSLog(@"fail");
  }

```

此demo为常见crash汇总与基本防护，详见demo
基本原理：http://www.jianshu.com/p/2b2997749d2d


