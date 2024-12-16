A more robust approach involves checking for `nil` receivers and the validity of selectors before invoking `performSelector:`:

```objectivec
BOOL validSelector = [someObject respondsToSelector:@selector(aMethodThatMightThrow)];

if (someObject != nil && validSelector) {
    @try {
        [someObject performSelector:@selector(aMethodThatMightThrow)];
    } @catch (NSException *exception) {
        NSLog("Exception caught: %@
", exception);
    }
} else {
    // Handle the case where the object or selector is invalid
    NSLog("Invalid object or selector");
}
```

This revised code explicitly checks if `someObject` is not `nil` and if it responds to the selector.  This preventative measure avoids the exception being thrown prematurely, ensuring that the `@try-@catch` block functions correctly.