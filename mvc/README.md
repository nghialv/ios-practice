## iOS 7 UIKit Practice


### Main Source

* <https://developer.apple.com/library/prerelease/ios/design/index.html#//apple_ref/doc/uid/TP40013289>


### Reference

* WWDC 2013 - Building User Interface for iOS 7
* WWDC 2013 - Custom Transitions Using View Controllers
* WWDC 2013 - Customizing Your app’s appearance in iOS 7
* WWDC 2013 - What's New in Cocoa Touch

* WWDC 2013 - What's New in iOS User Interface Design 


### Text Kit

* __WWDC 2013 - Introducing Text Kit__
* __WWDC 2013 - Using Fonts with Text Kit__
* __WWDC 2013 - Advanced Text Layouts and Effects with Text Kit__


### Adaptive Multitasking

* __What's New in Multitasking__

### UIKit Dynamics

* __Getting Started with UIKit Dynamics__
* __Advanced Techniques with UIKit Dynamics__
* __Exploring Scroll Views on iOS 7__


### Motion Effects

* __Implementation Engaging UI on iOS__



### Dynamic Type

```objective-c
+[UIFont preferredFontForTextStyle:]`
```

added Kerning and Ligatures

### Letterpress

```objective-c
NSAttributeString *letterpressString = [[NSAttributedString alloc] 
    initWithString: @"Letterpress"
    attributes: @{NSTextEffectsAttributeName : NSTextEffectsLetterpressStyle}
```


### UI View

* scroll view content inset adjustments
    * contentInsets.top = 64

`-[UIViewController extendedEdgesForLayout]`
`UIExtendedEdgesAll`
`UIExtendedEdgesNone`

`-[UIViewController topLayoutGuide]`
`-[UIViewController bottomLayoutGuide]`

@"V:[topLayoutGuide]-3-[HDR]"


Status Bar Style
    * UIStatusBarStyleDefault
    * UIStatusBarStyleLightContent

```objective-c
//declarative specification API
@interface UIViewController
- (UIStatusBarStyle) preferedStatusBarStyle;
- (BOOL) prefersStatusBarHidden
```

enabled via Info.plist key `UIViewControllerBasedStatusBarAppearance`


### Gestures

`-[UINavigationController interactivePopGestureRecognizer]`

`-[UICollectionViewController usesLayoutToLayoutNavigationTransitions]`


### Color

[UIView tintColor]

[UIView tintColorDidChange]

### UITableView


`-[UITableViewCell separatorInset]`


### Alert View

* be able to insert your own content to the alert view
`UIView* contentView`


### Buttons

UIButton

```objective-c
typedef enum UIButtonType {
    UIButtonTypeCustom = 0,
    UIButtonTypeSystem, //new in iOS 7
};
//RoundedRect is deprecated !!!
```

UIBarButtonItem
```objective-c
typedef enum UIBarButtonItemStyle {
    UIBarButtonItemStylePlain,
    UIBarButtonItemStyleDone
};
//StyleBordered is deprecated!!
```

### Segmented Control

no Segmented control style !!!

### Switches and sliders

* use autolayout to cope with metrics changes

### Picker Views

* avoid using as a UIInputView
* present inline instead

### Search fields

```objective-c
@interface UISearchDisplayController
@property BOOL displaySearchBarInNavigationBar
@property UINavigationItem *navigationItem;
@end
```


### Overlapping Effect

radically faster snapshot effect
    * `-[UIView drawHierarchyInRect:]`

### App State Restoration

methods on UIApplicaiton object

```objective-c
//called from methods invoked by state restoration
- (void)ignoreSnapshotOnNextApplicationLaunch;

//non view and non-view controller objects can now participate
+ (void)registerObjectForStateRestoration:(id<UIStateRestoring>)object 
    restorationIdentifier:(NSString *)restorationIdentifier;
```

Blue tooth state restore


