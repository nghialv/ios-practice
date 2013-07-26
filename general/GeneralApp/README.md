### General App Test 

* [iOS App Programming Guide](https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide)
* [Mac App Programming Guide](https://developer.apple.com/library/mac/#documentation/General/Conceptual/MOSXAppProgrammingGuide)
# [iOS Human Interface Guideline]

## WWDC Session

 * 2013 - What's New in State Restoration / Framework
 * 2013 ???


### TODO

* Protecting Data Using On-Disk Encryption


### Optimization Tips

    * Adding the -mthumb compiler flag can reduce the size of your code by up to 35%. However, if your app contains floating-point–intensive code modules and you are building your app for ARMv6, you should disable the Thumb option. If you are building your code for ARMv7, you should leave Thumb enabled.
    
    * use __pngcrush__ <http://pmt.sourceforge.net/pngcrush/> to reduce image size
    
    * Avoid loading a large resource file when a smaller one will do. Instead of using a high-resolution image, use one that is appropriately sized for iOS-based devices. If you must use large resource files, find ways to load only the portion of the file that you need at any given time. For example, rather than load the entire file into memory, use the mmap and munmap functions to map portions of the file into and out of memory. For more information about mapping files into memory, see File-System Performance Guidelines.
    
    * If you build your app for ARMv6 and your code uses floating-point math extensively, compile that code without the -mthumb compiler option. The Thumb option can reduce the size of code modules, but it can also degrade the performance of floating-point code. If you build your app for ARMv7, you should always enable the Thumb option.
  * Transmit data packets in bursts whenever you can.
    * Cellular and Wi-Fi radios are designed to power down when there is no activity. Depending on the radio, though, doing so can take several seconds. If your app transmits small bursts of data every few seconds, the radios may stay powered up and continue to consume power, even when they are not actually doing anything. Rather than transmit small amounts of data more often, it is better to transmit a larger amount of data once or at relatively large intervals.
    
 * It is perfectly reasonable to implement handlers that respond to changes in network conditions, but do not be surprised if those handlers are not called consistently. 
 
 * If your app accesses the network using the Wi-Fi radios, you must notify the system of that fact by including the UIRequiresPersistentWiFi key in the app’s Info.plist file. The inclusion of this key lets the system know that it should display the network selection dialog if it detects any active Wi-Fi hot spots. It also lets the system know that it should not attempt to shut down the Wi-Fi hardware while your app is running.

### Interface Guideline tips


* As much as possible, avoid displaying a splash screen or other startup experience. (not the launch image)
*  Give tappable controls a hit target of about 44 x 44 points.
* Broadly speaking, there are three main styles of navigation, each of which is well suited to a specific app structure: hierarchical, flat, and content- or experience-driven.
* In general, it’s best to give users one path to each screen. If there’s one screen that users need to see in more than one context, consider using a temporary view, such as a modal view, action sheet, or alert.

* Modality—that is, a mode in which something exists or is experienced—has advantages and disadvantages. It can give users a way to complete a task or get information without distractions, but it does so by temporarily preventing them from interacting with the rest of the app.
* Be especially wary of creating a modal task that involves a hierarchy of views, because people can get lost and forget how to retrace their steps
* As much as possible, integrate status or other relevant feedback information into your UI.
* Avoid unnecessary alerts. 
* Incorporate a brand’s colors or images in a refined, unobtrusive way. 
* In general, avoid creating a custom UI element that performs a standard action.
* In general, run in all orientations.
* If possible, avoid sending users to Settings. I
* As much as possible, offer configuration options in the main UI. 
* When people directly manipulate onscreen objects instead of using separate controls to manipulate them, they're more engaged with their task and it’s easier for them to understand the results of their actions.

### Author 
Denny C. Dai