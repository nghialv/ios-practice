//
//  main.c
//  testExe
//
//  Created by Denny C. Dai on 2013-05-31.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "testMyObject.h"
#import "myClass.h"

//enum with fixed underlying type
typedef enum AppMode : NSUInteger {
    AppModeBasic,
    AppModeAdvanced
}AppMode;

//built in macro
typedef NS_ENUM(NSUInteger, AppModeEx){
    AppModeExBasic,
    AppModeExAdvanced
};;

static NSArray* gArr = nil;

int main(int argc, const char * argv[])
{
    __strong NSString* name; // strong is the default ! //implicitly initialized to nil !!
    
    //week reference var
    __weak id myObj = nil;
    __unsafe_unretained id unsafeMyObj = nil;
    
    {
        myObj = [[testMyObject alloc] init];
    
    }
    
    //zeroing week pointer is automatically changed to nil as the
    //local obj is deallocated on end of local block scope 
    NSLog(@"myObj = %@", myObj); 

    
    NSNumber* val = @23;
    NSNumber* val2 = @(3+1);
    NSNumber* val3 = @("0123456789ABCDEF"[5]);
    NSNumber* val4 = @(AppModeAdvanced);

    const char* str = "1232412";
    NSString* myStr = @(str);
    
    NSArray* arr = @[val,val2];

    gArr = @[];

    //the content it points to is constant, but value of the var itself is mutable
    const NSString*  thisStr = @"dennycd";
    thisStr = @"newstr";
    
    //the var itself is immutable, but the content it points to is immutable
    NSString* const thisConstSTr = nil;
//    thisConstSTr = @"newstr"; //variable itself is immutable
    
    int value = 1;
    const int* p = &value;
    //*p = 5;  //what p points to is immutable
    p = NULL; //p value itself is mutable
    
    int* const p1 = &value;
    //p1 = NULL;  //the val value itself immutable
    *p1 = 5; //but its pointing content is mutable

    int const* p2 = &value;
    p2 = NULL; //variable itself is mutable
    //*p2 = 6; //its point value is immutable
    
    
    
    
    
    
    
    
    NSDictionary* dict = @{@"val" : val, @"val2" : val2};
    NSLog(@"%@\n%@",arr,dict);
    
    NSLog(@"%@", dict[@"val"]);

    
    
    testMyObject* obj = [[testMyObject alloc] init];
    [obj foo];
    
    
    MyClass* obj2 = new MyClass();
    obj2->foo();
    delete obj2;
    
    // insert code here...
//    CFShow(CFSTR("Hello, World!\n"));
    return 0;
}
