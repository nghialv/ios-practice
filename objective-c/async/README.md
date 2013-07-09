### Async with Block, GCD and XPC 


### Blocks 
* Blocks are created on the stack
* maybe copied to the heap 
    * const-copy scalar values
    * objective-C objects are retained 
    * other pointers copied as values, NOT their storage

*   dispatch queue and block are objective c objects
    * automatically retained / release by block
    * @property(retain)



### Reference 
    * WWDC 2012 session #712 - Asynchronous Design Patterns with Blocks, GCD, and XPC