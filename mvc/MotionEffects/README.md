### UIKit Dynamics / Motion Effect 

* applies relative values to keypaths of a target view
* affected by device "pose" or position
* affects animatable properties only 


#### UIInterpolatinMotionEffect

attach the effect to the view

* initialization

```objective-c
- (instancetype)initWithKeyPath:(NSString *)keyPath 
    type:(UIInterpolatingMotionEffectType)type


typedef enum {
   UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis,
   UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis
} UIInterpolatingMotionEffectType;


@property (retain, nonatomic) id minimumRelativeValue;
@property (retain, nonatomic) id maximumRelativeValue;
```

To customize your own motion effect, inherit `UIMotionEffect` and subclass
```objective-c

- (NSDictionary *)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)viewerOffset


typedef struct UIOffset {
    CGFloat horizontal, vertical; // specify amount to offset a position, positive for right or down, negative for left or up
} UIOffset;
```

Add/Remove motion effect
```objective-c
-(void)addMotionEffect:(UIMotionEffect *)effect;
-(void)removeMotionEffect:(UIMotionEffect *)effect;
```

Existing effects 
```objective-c
@property(copy, nonatomic) NSArray* motionEffects;
```