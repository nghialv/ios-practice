### UI Dynamics 

#### WWDC

* Getting Started with UIKit Dynamics 
* Advanced Techniques with UIKit Dynamics 


#### UIDynamicAnimator 

```objective-c
@interface UIDynamicAnimator: NSObject
- (instancetype)initWithReferenceView:(UIView*)view;
- (void)addBehavior:(UIDynamicBehavior *)behavior;
- (void)removeBehavior:(UIDynamicBehavior *)behavior;
- (void)removeAllBehaviors;
@property (nonatomic, readonly) UIView* referenceView;
@property (nonatomic, readonly, copy) NSArray* behaviors;

- (NSArray*)itemsInRect:(CGRect)rect;
- (void)updateItemFromCurrentState:(id <UIDynamicItem>)item;

@property (nonatomic, readonly, getter = isRunning) BOOL running;
- (NSTimeInterval)elapsedTime;

@property (nonatomic, assign) id <UIDynamicAnimatorDelegate> delegate;

@end
```


#### UIDynamicBehavior

```objective-c
NS_CLASS_AVAILABLE_IOS(7_0) @interface UIDynamicBehavior : NSObject

- (void)addChildBehavior:(UIDynamicBehavior *)behavior;
- (void)removeChildBehavior:(UIDynamicBehavior *)behavior;

@property (nonatomic, readonly, copy) NSArray* childBehaviors;

// When running, the dynamic animator calls the action block on every animation step.
@property (nonatomic,copy) void (^action)(void);

@end
```

a list of supported behaviour 

    * UIAttachmentBehavior
    * UICollisionBehavior
    * UIGravityBehavior
    * UIPushBehavior
    * UISnapBehavior
    * UIDynamicItemBehavior
    

#### UIDynamicItem
