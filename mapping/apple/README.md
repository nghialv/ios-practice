### Location Framework Test 


#### WWDC Reference 

* What's New in Core Location @ 2013
* What's New in Map Kit @ 2013  





### Enable Location Service 

The value for the UIRequiredDeviceCapabilities is an array of strings indicating the features that your app requires. There are two strings relevant to location services:

Include the location-services string if you require location services in general.
Include the gps string if your app requires the accuracy offered only by GPS hardware.


### Enable Direction Service

If your app requires some form of direction-related information in order to function properly, you should include the UIRequiredDeviceCapabilities key in the app’s Info.plist file. This key contains an array of strings indicating the features that your app requires of the underlying iOS-based device. The App Store uses this information to prevent users from installing apps on a device without the minimum required hardware.

For direction-related events, there are two relevant strings you can associate with this key:

magnetometer—Include this string if your app requires the presence of heading information.
gps—Include this string if your app requires the presence of course-related information.



### Geocoding Best Practice 

* Send at most one geocoding request for any one user action.
* If the user performs multiple actions that involve geocoding the same location, reuse the results from the initial geocoding request instead of starting individual requests for each action.
* When you want to update the location automatically (such as when the user is moving), reissue the geocoding request only when the user's location has moved a significant distance and after a reasonable amount of time has passed. For example, in a typical situation, you should not send more than one geocoding request per minute.

* Do not start a geocoding request at a time when the user will not see the results immediately. For example, do not start a request if your app is in the background or was interrupted and is currently in the inactive state.
