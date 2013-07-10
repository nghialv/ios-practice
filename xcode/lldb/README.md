## LLDB Debuging Practice 

### Reference 

* WWDC 2013 - Advanced Debugging with LLDB

* WWDC 2012 - Debugging with LLDB
* WWDC 2010 - Advanced Memory Analysis with Instruments


### Debug

* `NS_BLOCK_ASSERTIONS` disables assertion in release builds

* logging with Apple System Log
    * console.app
    * levels
        * `ASL_LEVEL_EMERG`
        * `ASL_LEVEL_DEBUG`
    * use hashtag `#web` in log message

* use NSUserDefaults to switch on/off heavy logging

* use `-Weverything` to turn on all warnings
* guard malloc catches buffer overruns on the heap
* zombie objects



### LLDB Console Commands

* Discoverable form
    * `expression --object-description -- foo`
* Abbreviated form
    * `e -0 -- foo`
* alias form
    * `po foo`



### Set Breakpoints

 * `b MyView.m:4`
 * `breakpoint set --file MyView.m --line 4`


