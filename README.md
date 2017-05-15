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
    NSString *good = [[NSString alloc]initWithString:nil];
    NSString *good2 = [NSString stringWithString:nil];

    NSString *tempContstStr = @"123123";
    NSString *tempContstStr1 = [tempContstStr substringFromIndex:10];
    NSString *tempContstStr2 = [tempContstStr substringToIndex:10];
    NSString *tempContstStr3 = [tempContstStr substringWithRange:NSMakeRange(6, 1)];

    NSString *tempPointStr = [[NSString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempPointStr1 = [tempPointStr substringFromIndex:10];
    NSString *tempPointStr2 = [tempPointStr substringToIndex:10];
    NSString *tempPointStr3 = [tempPointStr substringWithRange:NSMakeRange(6, 1)];

    NSMutableString *tempCFStr = [[NSMutableString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempCFStr1 = [tempCFStr substringFromIndex:10];
    NSString *tempCFStr2 = [tempCFStr substringToIndex:10];
    NSString *tempCFStr3 = [tempCFStr substringWithRange:NSMakeRange(6, 1)];
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

```objective-c
    NSMutableDictionary *tempDict = [NSMutableDictionary new];
    [tempDict setObject:nil forKey:@"1"];
    [tempDict removeObjectForKey:@"2"];
    [tempDict removeObjectForKey:nil];
```

```objective-c
    [self addObserver:self forKeyPath:nil options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [self removeObserver:nil forKeyPath:@"kvc"];
    [self.navigationController pushViewController:self animated:YES];
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

crash warning：
----------
```objective-c

    for (int i = 0; i < 10000; i++){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                self.model = [TestModel new];
        });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                self.model = [TestModel new];
        });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                self.model = [TestModel new];
        });
    }
```

此demo为常见crash汇总与基本防护，详见demo
----------
基本原理：http://www.jianshu.com/p/2b2997749d2d


