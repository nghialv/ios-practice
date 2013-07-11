## LLDB Debuging Practice 
______


### Reference 

* WWDC 2013 - Advanced Debugging with LLDB
* WWDC 2013 - Debugging with Xcode

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

Stop at a line
    
 * `b MyView.m:4`
 * `breakpoint set --file MyView.m --line 4`


Stop at a method - symbolic breakpoint
    * `b "-[MyViewA drawRect:]" `
    * `breakpoint set --name "-[MyViewA drawRect:]" `



Stop whenever any object receives a selector
    * `b drawRect:`
    * `breakpoint et --selector drawRect:`



### Breakpoint Commands
tell lldb to do a series of actions each time it hit a breakpoint

    * `b "-[MyViewA setNeedsDisplayinRect:]"`
    * `br co a`  or  `breakpoint command add`
        * `p rect` or `expression rect`
        * `bt` or `thread backtrace`
        * `c` or `process continue`
        * DONE

### Breakpoint Conditions
only break when a condition is met

* `p id $myModel = self`   - create a persistent variable of type id and assign value to self
* `b "-[MyModel dealloc]"` - will break when this method get called
* `br m -c "self == $myModel"` - break only if current self is equal to myModel


### Watch Point
stop when a particular location in mem is modified

* `watchpoint set variable self->_needsSynchronization` or `w s v self->_needsSynchronization`

### Continue on
    * `thread until 11` or `th u 11`

LLDB will stop in one of the two cases
    * at the specified line, if your code goes there
    * after the function returns


in XCode, right click on editor left panel, chose `Continue until here `

### Hitting Breakpoints while stepping

then click `Continue` will get u to next line of code in your previous stepping


### Call your code by hand
for code that is hard to reach during a test. Use Clang to actually call a function

    * `b "-[ModelDerived removeDuplicates]"`
    * `e -i false -- [self removeDuplicates]`  or `expression --ignore-breakpoints false -- [self removeDuplicates]`

______

### Commands

__frame variable__
    
    * show all my local
    * `frame variable [var_name]` to show specific

__expression [exp]  or __p [exp]__

    * execute arbitrary code
    * `expression (x+35)`

__po [exp]__

    * execute arbitrary code, then call the `description` selector on the result objc object !!

### Data format facility

built-in formatters for system libraries
    * STL
    * CoreFoundation
    * Foundation

Python Summary
    * match a type to a Python function
    * base matcing by type
    * <http://lldb.llvm.org/varformats.html>


`ty su a MyAddress -F MyAddress_Summary` or
`type summary add MyAddress --python-function MyAddress_Summary`



### Deal with Opaque objects

define a data structure in lldb, Use `$` to make it persistent

```cpp
expression
struct $MyStruct {
    int item1;
    float item2;
    char* item3;
};
```
then in debugger cast the obj into this type


### Extending LLDB

LLDB Object Model
    * Scripting Bridge - python API

SBTarget
    * SBProcess
        * SBThread
            * SBFrame


Adding a custom function to the lldb environment
`command script add foo --python-function foo`  or `co sc a foo -f foo`

Example

```python
//utilize LLDB Object Model
thread = debugger.GetSelectedTarget().GetProcess().GetSelectedThread();

//loop over all frames
for frame in thread.frames:
   if frame.function.name == "MyFunction":
         //update counter

print >> result, "depth: " counter
```


### Breakpoint Actions via Python Function
* associate a breakpoint with a python Function
* the function is invoked whenever the breakpoint is hit
* the function can return false to tell LLDB to continue your program without breaking at this point

`breakpoint command add --script python --python-function foo 1`

### Productizing Customization

* LLDB-specific configuration file
    * `~/.lldbinit`
    * loaded at debugger startup
    * load scripts
    * or `~/.lldbinit-Xcode` for xcode-specific version



#### Author
Denny C. Dai <dennycd@me.com>