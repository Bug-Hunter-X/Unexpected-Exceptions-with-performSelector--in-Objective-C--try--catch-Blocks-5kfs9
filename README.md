# Objective-C Exception Handling Gotcha: performSelector:

This repository demonstrates a subtle issue in Objective-C's exception handling related to the `performSelector:` method.  When using `performSelector:` within a `@try-@catch` block, exceptions originating from `performSelector:` itself (e.g., due to a `nil` receiver or invalid selector) might not be caught, leading to unexpected crashes.

The `bug.m` file shows the problematic code, and `bugSolution.m` illustrates a safer approach.

## Problem

Exceptions thrown by `performSelector:` before the `@try` block's code begins executing are not handled by the `@catch` block.  This is because the exception occurs during the message sending mechanism, not inside the `@try` block's scope.

## Solution

The solution involves explicitly checking the validity of the object and selector before calling `performSelector:`.  This prevents potential exceptions at the message-sending stage.