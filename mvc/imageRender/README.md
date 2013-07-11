### Image and View 


create an image with a rendering mode 

```objective-c
-(UIImage*) imageWithRenderingMode: (UIImageRenderingMode) renderingMode;
```

UIView's ` UIColor* tintColor` defines the context used for this rendering
    * hierarchical - push down to subviews


```objective-c
typedef NS_ENUM(NSInteger, UIImageRenderingMode) {
    UIImageRenderingModeAutomatic,          // Use the default rendering mode for the context where the image is used
    UIImageRenderingModeAlwaysOriginal,     // Always draw the original image, without treating it as a template
    UIImageRenderingModeAlwaysTemplate,     // Always draw the image as a template image, ignoring its color information
} NS_ENUM_AVAILABLE_IOS(7_0);
```


dimming adjustment behaviour 

```objective-c
@property(nonatomic) UIViewTintAdjustmentMode tintAdjustmentMode;

...

typedef NS_ENUM(NSInteger, UIViewTintAdjustmentMode) {
    UIViewTintAdjustmentModeAutomatic,
    UIViewTintAdjustmentModeNormal,
    UIViewTintAdjustmentModeDimmed,
} NS_ENUM_AVAILABLE_IOS(7_0);

```

finding about changes 
```objective-c
- (void)tintColorDidChange;
```

#### View Animation

no animation
```objective-c
 + (void) performWithoutAnimation:(void (^)(void))actionsWithoutAnimation;
```


KeyFrames 

```objective-c
+ (void)animateKeyframesWithDuration:(NSTimeInterval)duration 
        delay:(NSTimeInterval)delay 
        options:(UIViewKeyframeAnimationOptions)options 
        animations:(void (^)(void))animations 
        completion:(void (^)(BOOL finished))completion;


+ (void)addKeyframeWithRelativeStartTime:(double)frameStartTime 
        relativeDuration:(double)frameDuration 
        animations:(void (^)(void))animations;

```

more UIView keyframe animation APIs



### Author 
Denny C. Dai <dennycd@me.com>