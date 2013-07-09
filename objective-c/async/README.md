### Async with Block, GCD and XPC 


### Design Patterns

* don't block the main thread 
* run task in the background 
* don't block many background thread
    * use a serial dispatch queue 
    * use GCD's asynchrounous IO
* integrate with the main loop 
    * `dispatch_get_main_queue()`
    * API with runloop-based callback
* one queue per sub system 
    * subdivide app into independent subsystems 
    * control access to subsystems with serial dispatch queues
    * main queue is access queue for UI subsystem 
* improve performance with reader-writer access 
    * `DISPATCH_QUEUE_CONCURRENT` 
    * synchronous concurent __read__
        * dispatch_sync()
    * asycn serialized __writes__
        * `dispatch_barrier_async()`
* separate control and data flow  
    * dispatch queue not designed for general-purpose data storage 
    * no cancellation, no random access 
    
* update state asychronously 
    * `dispatch_source`
    
* mvoe out of process with XPC
    * reliability and security 
    * fault isolation and priviledge separation
    * XPC connection as a "remote queue"


### Blocks 
* Blocks are created on the stack
* maybe copied to the heap 
    * const-copy scalar values
    * objective-C objects are retained 
    * other pointers copied as values, NOT their storage

*   dispatch queue and block are objective c objects
    * automatically retained / release by block
    * @property(retain)

* Retain cycle

* Interior Pointers 
     * pointer lifetime tied to container object
     * add `__attribute__((objc_precise_lifetime))`

### Reference 
    * WWDC 2012 session #712 - Asynchronous Design Patterns with Blocks, GCD, and XPC
    * WWDC 2011 session #210 - Mastering Grand Central Dispatch