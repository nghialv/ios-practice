### iOS 7 Multi-Tasking Stuff


#### Background fetching

added __fetch__ mode to app's info plist for a new background mode. App will be launched opportunistically

new delegate method on UIApplication is called 
```objective-c
-(void)application:(UIApplication*)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler;
```
user call completion handler when fetch is complete

tuning the fetch interval. user call this at launch
```objective-c
-(void)setMinimumBackgroundFetchInterval: (NSTimeInterval)minInterval;

//const NSTimeInterval UIApplicationBackgroundFetchIntervalMinimum
//const NSTimeInterval UIApplicationBackgroundFetchIntervalNever
```

#### Remote notification

new background mode:
    * `remote-notification`

new delegate 
```objective-c
-(void)application:(UIApplication *)application 
    didReceiveRemoteNotification:(NSDictionary *)userInfo 
    fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;
```

again, call the complete handler when your fetch operation is done 

```objective-c
typedef NS_ENUM(NSUInteger, UIBackgroundFetchResult) {
    UIBackgroundFetchResultNewData,
    UIBackgroundFetchResultNoData,
    UIBackgroundFetchResultFailed
} NS_ENUM_AVAILABLE_IOS(7_0);
```

#### Background transfers

NSURLSession 
    * replaces NSURLConnection
    * data, upload, download task
    * sessions have identifiers 
    
delegate method 

```objective-c
-(void)application:(UIApplication *)application 
    handleEventsForBackgroundURLSession:(NSString *)identifier 
    completionHandler:(void (^)())completionHandler;
```





### Author 
Denny C. Dai <dennycd@me.com>