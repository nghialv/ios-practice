## ObjC Language Practice Project


### Reference 

* WWDC 2013 # 404 - Advances in Objective-C
* WWDC 2012 # 405 - Modern Objective-C
* WWDC 2012 # 406 - Adopting Automatic Reference Counting
* WWDC 2012 # 413 - Migrating to Modern Objective-C

## Accessor
* always use accessor method , except
    * initialization method
    * dealloc 
* always declare ivars in private class extenstion in the implementation file

* Apple reserves __Accessor Name__ starting with `_`
* use `_` prefix for instance variables is encouraged

### ARC Basic
* Think about ownership
    * strong references keep objects alive
    * objects deallocated when no more strong references remain
* Think about your __object graph__

* __Weak Reference__
    * safe, non-retaining reference
    * __drop itself__ to nil automatically 


* naming prefix that will transfer ownership
    * `alloc`
    * `copy`
    * `init`
    * `mutableCopy`
    * `new`

* use `__weak` to decorate the delegate variable 

### Notes 


* Problems
    * how  `#import` works
        * header fragility
        * header not included in order, will get runtime error mythitically 
    * preprocessing of headers and textual inclusion , in a recursive way
    * inherently non-scalable compile times 
    * M source files + N headers => M*N compile time 
    * precompiled headers help 

* __Modules__
    *  `@import`
        * a __semantic import__ 
        * a declaration access framework API 
        * don't need to parse the headers 
        * can import a small part of a framework
            * `@import iAd.ADBannerView` == `#import<iAd/ADBannerView>`

* modules implicitly disabled for C++ sources 
* modules not available for user frameworks 



### Objective-C Runtime 
    * dynamic behaviour 
    * method dispatch
    * object introspection
    * object proxies 
    * dynamic class construction and replacement 
    
Existing features
    * key-value observing 
    * associated objects 
    * @synchronized
    * weak reference
    * tagged pointers 
        * for 64-bit cocoa for samll value-lie objects
            * NSNumber, NSDate 
            * store the value insided the pointer variable itself ! (no malloc/free)

don't do 
    * raw `isa` access
    * access tagged pointer 

### Implicit Bridging 


### Retain Cycles in the presence of ARC

use `-Warc-retain-cycles`
use `-Wreceiver-is-weak`
use `-Warc-repeated-use-of-weak`

### Invoking CoreFoundation and ARC

```objective-c
NSString* str = (__bridge NSString*)CFDictionaryGetValue(_dict, @"key");
```
* +1 via CFBridgingRetain()
* -1 via CFBridingRelease()
* +0 via "__bridge" casts to avoid mistakes 


### Improvements 

Added Language Feature
* object literals
* container literals 
* subscripting 


Others 
* return type correctness using __related result type__
    * `instancetype`
        * REFERENCE http://clang.llvm.org/docs/LanguageExtensions.html

* explicit type enums 
    * enables return type inference 



