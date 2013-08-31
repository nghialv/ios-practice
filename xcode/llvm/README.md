## LLVM / Clang Compiler Practice 


### Reference 

* WWDC 2013 # 402 - What's New in LLVM Compiler 
* WWDC 2013 - Optimize your code with LLVM


### Notes

* using AVX2 with fallback to AVX/SSE 
    * "Enable Additional Vector Extensions" - AVX2
* strict aliasing: more advanced pointer analysis
    * "Enforce Strict Aliasing" - YES
* link-time optimization (LTO)
    * "Link-Time Optimization" - YES
    * may require a lot memory
        * try "Debug Information Level " -> Line Tables Only    -gline-tables-only
* Auto Vectorizer 
    * accelerae comp intensive loop 
    * "Vectorize Lopps" - > YES 
    
* -Ofast Optimization Level for releae buld
    * all -O3 optmizatio 
    * -ffast-math
    * vectorizer
    * don't use it for high floating point precision requirement

* C++11 support 

* libc++ 
    * C++11 lang features
    * lib components 
    
    
* Warnings 
    * unsequenced modifications - order of some operations is not specified  (e.g.  x = x++; )
    * integer overflow 
        * return 123456 * 789012
    * Unused functions 
        * dead code that can be removed
    * implicit boolean conversion 
    * implicit enum conversions 
    * undeclared selectors 
    * mismatched return types 
        * -Wreturn-type
    * unintentional root classes 
  * mismatched allocators 
    
* Static Analyzer 
    * objc cross method analysis

* Analyze during build !!
    * turn on in the setting 
    *  xcodebuild analyze -project HappyBirds.xcodeproj
    
* Mode of Analysis  [Deep] or [Shallow] under Static Analyzer

* turn on comment documentation check 
    * "Documentation Comments"
    * HeaderDoc
    * Doxygen 

### LLVM Stuff

__armv7s architecutre
    * for A6 processor , iPhone 5 and new iPads

Intel AVX
    * advanced vector

