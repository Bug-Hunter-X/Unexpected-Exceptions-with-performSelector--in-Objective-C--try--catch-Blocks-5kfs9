In Objective-C, a common yet subtle issue arises from the interaction between Objective-C's message passing mechanism and exception handling.  Consider this scenario:

```objectivec
@try {
    // Method call that might throw an exception
    [someObject performSelector:@selector(aMethodThatMightThrow)];
} @catch (NSException *exception) {
    // Handle the exception
    NSLog("Exception caught: %@
", exception);
}
```

If `aMethodThatMightThrow` throws an exception, the `@catch` block will indeed handle it. However, if `performSelector:` itself encounters an issue (e.g., `someObject` is `nil`, or the selector is invalid), an exception might be thrown *before* the `@try` block's execution even begins. This exception won't be caught, leading to unexpected crashes.

This behavior differs from typical try-catch blocks in other languages where the `try` block's code is guaranteed to execute unless an exception occurs within it.