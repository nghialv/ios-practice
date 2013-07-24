### General App Test 

* [iOS App Programming Guide](https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide)
* [Mac App Programming Guide](https://developer.apple.com/library/mac/#documentation/General/Conceptual/MOSXAppProgrammingGuide)


## WWDC Session

 * 2013 - What's New in State Restoration / Framework
 * 2013 ???


### TODO

* Protecting Data Using On-Disk Encryption


### Optimization Tips

    * Adding the -mthumb compiler flag can reduce the size of your code by up to 35%. However, if your app contains floating-point–intensive code modules and you are building your app for ARMv6, you should disable the Thumb option. If you are building your code for ARMv7, you should leave Thumb enabled.
    
    * use [pngcrush](http://pmt.sourceforge.net/pngcrush/) to reduce image size 
    
    * Avoid loading a large resource file when a smaller one will do. Instead of using a high-resolution image, use one that is appropriately sized for iOS-based devices. If you must use large resource files, find ways to load only the portion of the file that you need at any given time. For example, rather than load the entire file into memory, use the mmap and munmap functions to map portions of the file into and out of memory. For more information about mapping files into memory, see File-System Performance Guidelines.
    
    * If you build your app for ARMv6 and your code uses floating-point math extensively, compile that code without the -mthumb compiler option. The Thumb option can reduce the size of code modules, but it can also degrade the performance of floating-point code. If you build your app for ARMv7, you should always enable the Thumb option.
  * Transmit data packets in bursts whenever you can.
    * Cellular and Wi-Fi radios are designed to power down when there is no activity. Depending on the radio, though, doing so can take several seconds. If your app transmits small bursts of data every few seconds, the radios may stay powered up and continue to consume power, even when they are not actually doing anything. Rather than transmit small amounts of data more often, it is better to transmit a larger amount of data once or at relatively large intervals.
    
 * It is perfectly reasonable to implement handlers that respond to changes in network conditions, but do not be surprised if those handlers are not called consistently. 
 
 * If your app accesses the network using the Wi-Fi radios, you must notify the system of that fact by including the UIRequiresPersistentWiFi key in the app’s Info.plist file. The inclusion of this key lets the system know that it should display the network selection dialog if it detects any active Wi-Fi hot spots. It also lets the system know that it should not attempt to shut down the Wi-Fi hardware while your app is running.

### Author 
Denny C. Dai