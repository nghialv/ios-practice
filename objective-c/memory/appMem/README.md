### Dealing with Memory Issues

## Reference 

* Fixing Memory Issues - WWDC 2013 
* Building Efficient OS X Apps  - WWDC 2013
* Energy Best Practices 
* Designing Code for Performance

## Document 

[Advanced Memory Management Programming Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html#//apple_ref/doc/uid/10000011i)

### Notes 
    * Instruments focused on allocation heap 
    * Processes contain more than just heap moery 
        * app code
        * images and other media    
        
        
### Virtual Memory 

Reserved vs. Resident

    * reserved as regions 
        * 4KB page aligned 
        * pages mapped to physical memory on first read/write 
            * zero-filled or read from storage 
            * once mapped, virtual memory is also resident 
        * physical memory typically more constrained 

Clean vs. Dirty

    * Clean pages can be discarded and recreated 
        * memory mapped files, executable __TEXT segments, purgeable memory 
    * Changing a page marks it as dirty
        * malloc heap, global variables, stacks, etc 
        * can be swapped to compressed form or storage on OS X
            * moving from physical ram to swap space
            
Private vs. Shared 
    * virtual memory can be named to enable sharing 
    * mapped files are implicityly shareable 
    
    
    
### Heap  - storage for malloc calls 

* dynamic allocation using malloc
    * `malloc` in C
    * `[NSObject alloc]` in Objective-C
    * `new` operators in C++
* backed by VM : MALLOC regions 

VM is about bytes, heap is about counts !!

* prefix your class name


### Memory Issues

* leaked memory 
    * inaccessible - no more pointers to it 
    * can't ever be used again
* abandoned memory 
    * still referenced, but wasted
    * won't ever be used again
    * e.g. a global var only been used in a startup function, but that function will never get called after program run 
* cached memory 
    * referenced and waiting 
    * might never be used again
    
    
### Generation Analysis (previous Heap Shot)
for detecting abandoned memory and excessive caching. Technique for measuring memory growth 

* reach a steady state
* record first generation of active alloc
* perform a series of operations, returning to steady state
* record a new generation of incremental alloc
* repeat step 3 and 4

incremental allocations represent potential problems 


#### Heap fragmentation 
* fragmentation is poor utilization of malloc VM regions 
* effectively wasted space
* impossible for system to reclaim

use All Heap Allocation graph to check for peak 
    * avoid frequent high watermark , meaning large for loop of memory alloc 
    
    
### Common problems under ARC
    
Memory growth
    * unreferenced retain cycle --> leaks template
    * abandoned objects --> generational analysis 

Messaging deallocated objects 
    * undefined / non-deterministic behaviour 

__Zombie Templates__
    * object that has been deallocated, -> changed into zombie objects
    * if you send a message on them, they are for sure to crash 
    

### Common Objective-C Issues 

* ^block captures and retain cycles 
* instance variables implicitly reference self 
* use __weak keyword to break cycles 
* look out for persisting relationships 
    * registration (e.g. NSNotification, error callback)
    * recurrences (e.g. timers, handlers )
    * one time executions (dispatch_async, dispatch_after) are fine



### __weak

* avoid consecutive uses of weak variables 
* never invoke -> deference !!
    * use . synatx
    * create a strong obj, copy the weak value, check for nil, then use it 
* do not over-use __weak 
    * _weak variables are not free, there's some overhad 
    
### __unsafe_unretained 

* no ARC-managed retain and release 
* translate `assign` to __unsafe_unretained 
* can easily lead to crash 
* unretained framework references 

### __autoreleasing 

__autoreleasing to denote arguments that are passed by reference (id *) and are autoreleased on return. [ARC Transition Guilde](http://developer.apple.com/library/mac/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html)


* object sent - retain/autorelease upon assignment 
* out parameters are __autoreleasing by default (e.g. NSError**)

### Briding with C-based API 

* __bridge T - type casting 
* __bridge_transfer T / CFBridgingRelease() - issue a release 
* __bridge_retained T / CGBridgingRetain() - issue a retain


### Testing 
* constrained devices 
* test first install  / first launch 
* large datasets 
* background launch 


### System Memory Pressure 
 * pages must be evicted 
 * clean and purgeable pages can be thrown away 
 * dirty pages 
    * on OSX, compressed or saved to disk (expensive)
 
### Avoid Termination
    * VM Tracker 
    * avoid large rapid allocation
    * noti arrives on main thread 
    
three ways to respond 

* `UIApplicationDidReceiveMemoryWarningNotification`
* `[id <UIApplicationDelegate> - applicationDidReceiveMemoryWarning: ]`
* `[UIViewController didReceiveMemoryWarning]`

consider freeing up memory before entering background 

## Summary 
    * avoid memory spikes
    * __weak , @autoreleasetool

### Author 
Denny C. Dai <dennycd@me.com>
