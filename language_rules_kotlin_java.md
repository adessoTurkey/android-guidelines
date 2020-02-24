## Kotlin / Java language rules

### Don't ignore exceptions

You must never do the following:

```kotlin
fun setServerPort(value: String) {
    try {
        serverPort = Integer.parseInt(value)
    } catch (e: NumberFormatException) { }
}
```

_While you may think that your code will never encounter this error condition or that it is not important to handle it, ignoring exceptions like above creates mines in your code for someone else to trip over some day. You must handle every Exception in your code in some principled way. The specific handling varies depending on the case._ - ([Android code style guidelines](https://source.android.com/source/code-style.html))

See alternatives [here](https://source.android.com/source/code-style.html#dont-ignore-exceptions).

### Don't catch generic exception

You should not do this:

```kotlin
try {
    someComplicatedIOFunction()        // may throw IOException
    someComplicatedParsingFunction()   // may throw ParsingException
    someComplicatedSecurityFunction()  // may throw SecurityException
    // phew, made it all the way
} catch (e: Exception) {                // I'll just catch all exceptions
    handleError()                      // with one generic handler!
}
```

See the reason why and some alternatives [here](https://source.android.com/source/code-style.html#dont-catch-generic-exception)

### Don't use finalizers

_We don't use finalizers. There are no guarantees as to when a finalizer will be called, or even that it will be called at all. In most cases, you can do what you need from a finalizer with good exception handling. If you absolutely need it, define a `close()` method (or the like) and document exactly when that method needs to be called. See `InputStream` for an example. In this case it is appropriate but not required to print a short log message from the finalizer, as long as it is not expected to flood the logs._ - ([Android code style guidelines](https://source.android.com/source/code-style.html#dont-use-finalizers))


### Arguments in Fragments and Activities

When data is passed into an `Activity` or `Fragment` via an `Intent` or a `Bundle`, the keys for the different values __must__ follow the rules described in the section above.

When an `Activity` or `Fragment` expects arguments, it should provide a `const val` method that facilitates the creation of the relevant `Intent` or `Fragment`.

In the case of Activities the method is usually called `getStartIntent()`:

```kotlin
companion object {
    private const val EXTRA_USER = "extra_user"
    
    fun getStartIntent(context: Context, user: User): Intent {
        return Intent(context, MainActivity::class.java).apply {
            putExtra(EXTRA_USER, user)
        }
    }
}
```

For Fragments it is named `newInstance()` and handles the creation of the Fragment with the right arguments:

```kotlin
companion object {
    private const val ARG_USER = "arg_user"

    fun newInstance(user: User): UserFragment {
        return UserFragment().apply {
            arguments = Bundle().apply {
                putParcelable(ARG_USER, user)
            }
        }
    }
}
```

__Note 1__: These methods should go at the top of the class before `onCreate()`.

__Note 2__: If we provide the methods described above, the keys for extras and arguments should be `private` because there is not need for them to be exposed outside the class.


### Logging guidelines

Use the logging methods provided by the `Log` class to print out error messages or other information that may be useful for developers to identify issues:

* `Log.v(tag: String, msg: String)` (verbose)
* `Log.d(tag: String, msg: String)` (debug)
* `Log.i(tag: String, msg: String)` (information)
* `Log.w(tag: String, msg: String)` (warning)
* `Log.e(tag: String, msg: String)` (error)

As a general rule, we use the class name as tag and we define it as a `const val` field at the top of the file. For example:

```kotlin
class MyClass {
    private const val TAG = MyClass::class.java.simpleName

    fun myMethod() {
        Log.e(TAG, "My error message")
    }
}
```

VERBOSE and DEBUG logs __must__ be disabled on release builds. It is also recommended to disable INFORMATION, WARNING and ERROR logs but you may want to keep them enabled if you think they may be useful to identify issues on release builds. If you decide to leave them enabled, you have to make sure that they are not leaking private information such as email addresses, user ids, etc.


## Idiomatic use of language features

### Immutability

Prefer using immutable data to mutable. Always declare local variables and properties as `val` rather than `var` if
they are not modified after initialization.

Always use immutable collection interfaces (`Collection`, `List`, `Set`, `Map`) to declare collections which are not
mutated. When using factory functions to create collection instances, always use functions that return immutable
collection types when possible:

```kotlin
// Bad: use of mutable collection type for value which will not be mutated
fun validateValue(actualValue: String, allowedValues: HashSet<String>) { ... }

// Good: immutable collection type used instead
fun validateValue(actualValue: String, allowedValues: Set<String>) { ... }

// Bad: arrayListOf() returns ArrayList<T>, which is a mutable collection type
val allowedValues = arrayListOf("a", "b", "c")

// Good: listOf() returns List<T>
val allowedValues = listOf("a", "b", "c")
```

### Type aliases

If you have a functional type or a type with type parameters which is used multiple times in a codebase, prefer defining
a type alias for it:

```kotlin
typealias MouseClickHandler = (Any, MouseEvent) -> Unit
typealias PersonIndex = Map<String, Person>
```

### Using conditional statements

Prefer using the expression form of `try`, `if` and `when`. Examples:


```kotlin
return if (x) foo() else bar()

return when(x) {
    0 -> "zero"
    else -> "nonzero"
}
```

The above is preferable to:

```kotlin
if (x)
    return foo()
else
    return bar()
    
when(x) {
    0 -> return "zero"
    else -> return "nonzero"
}    
```

### `if` versus `when`

Prefer using `if` for binary conditions instead of `when`. Instead of

```kotlin
when (x) {
    null -> // ...
    else -> // ...
}
```

use `if (x == null) ... else ...`

Prefer using `when` if there are three or more options.