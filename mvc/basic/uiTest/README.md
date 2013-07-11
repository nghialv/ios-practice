## iOS 7 UIKit Practice

### Reference

* WWDC 2013 - Building User Interface for iOS 7

* WWDC 2013 - Introducing Text Kit
* WWDC 2013 - Using Fonts with Text Kit
* WWDC 2013 - Advanced Text Layouts and Effects with Text Kit

* WWDC 2013 - Custom Transitions Using View Controllers
* WWDC 2013 - Customizing Your app’s appearance in iOS 7



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

### Adaptive Multitasking



















