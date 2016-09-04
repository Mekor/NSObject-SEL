# NSObject-SEL
performSelector扩展为多个参数

系统中提供了一些`performSelector`方法,比如:

```
- (id)performSelector:(SEL)aSelector;
- (id)performSelector:(SEL)aSelector withObject:(id)object;
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
```

但是,当我们的参数个数有多个的时候,这些方法是不适用的,所以`NSObject-SEL`的目的就是为了扩展`performSelector`方法:

```
-(id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
```
具体使用可以参考Demo,主要注意一点,因为参数是使用数组所以里面不能包含nil,如果想传nil可以`[NSNull null]`.

举例:

```
[self performSelector:@selector(gobackWith:title:age:) withObjects:@[@"wz",[NSNull null],@18]];
```


