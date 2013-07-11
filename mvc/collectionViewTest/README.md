### Collection View Stuff


#### Transition between layouts !!

```objective-c
- (void)setCollectionViewLayout:(UICollectionViewLayout *)layout 
    animated:(BOOL)animated
    completion: (void (^)(BOOL finished))completion;
```

#### UICollectionViewTransitionLayout

help animate layout transition in a collection view 


```objective-c
//initilize
- (id)initWithCurrentLayout:(UICollectionViewLayout *)currentLayout nextLayout:(UICollectionViewLayout *)newLayout


//managing values 
- (void)updateValue:(CGFloat)value forAnimatedKey:(NSString *)key
- (CGFloat)valueForAnimatedKey:(NSString *)key


//progress
@property (assign, nonatomic) CGFloat transitionProgress;


```