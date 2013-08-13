//
//  AppDelegate.m
//  objc-test
//
//  Created by Denny C. Dai on 2013-07-01.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "AppDelegate.h"
#import "TestObject.h"
#import "TestSubObject.h"
#import "TestSubObjectEx.h"
#import "MyCppCls.h"


//@import iAd;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MyCppCls* obj2 = new MyCppCls(self);
    delete obj2;
    
    TestSubObject* subojc = [[TestSubObject alloc] init];
    subojc.extraName = @"dennycd";
    
    
    /**
      Object allocation and initialization 
     **/
    //alloc is defined on NSObject as a class method, it allocates space for the entire concrete object
    //init then populates the object with values
    TestObject *obj = [[TestObject alloc] initWithName:@"dennycd"];
    
    //messaging a object
    //target is obj, message is foo
    [obj foo];
    
    //messagin a class
    [TestObject bar];
    
    
    //dot syntax
    obj.value = 13;  //[obj setValue:13]
    NSLog(@"%d", obj.value); //[obj value]
    
    
    //declare a var that is an object conforming to a protoocl
    id<MyProtocol> myobj = obj;
    [myobj myFunc];
    
    
    //Some classes define objects that are immutable.
    NSString* myname = @"dennycd"; //immutable
    NSMutableString* mynamemut = [NSMutableString stringWithString:@"dennycd"];
    
    
    {
        TestSubObject* myobj = [[TestSubObject alloc] init];
        [myobj foo];
    }
    
    
    //Use new to Create an Object If No Arguments Are Needed for Initialization
    {
        //equivalet to [TestObject alloc] init];
        TestObject* obj2 = [TestObject new];
        
    }
    
    
    //Literals Offer a Concise Object-Creation Syntax
    {
        NSString* myStr = @"dennycd";
        NSNumber *myBOOL = @YES;
        NSNumber *myFloat = @3.14f;
        NSNumber *myInt = @42;
        NSNumber *myLong = @42L;
        
        //number with boxed expression
        //In this case, the expression is evaluated, and an NSNumber instance created with the result.
         NSNumber *myInt1 = @(84 / 2);
    }
    
    //object equality
    {
        TestObject* obj1 = [[TestObject alloc]init];
        TestObject* obj2 = obj1;
        TestObject* obj3 = [TestObject new];
        NSAssert(obj1 == obj2, @"error"); //two pointer points to the same object
        
        //not equal
        NSLog(@"%@", ([obj1 isEqual:obj3] ? @"equal" : @"not equal"));
    }
    
    //Note: If you expect a return value from a message sent to nil, the return value will be nil for object return types, 0 for numeric types, and NO for BOOL types.
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
