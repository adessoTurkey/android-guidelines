# Kotlin / Java style rules

## Formatting &  Line length limit

Code lines should not exceed __100 characters__. If the line is longer than this limit there are usually two options to reduce its length:

* Extract a local variable or method (preferable).
* Apply line-wrapping to divide a single line into multiple ones.

There are two __exceptions__ where it is possible to have lines longer than 100:

* Lines that are not possible to split, e.g. long URLs in comments.
* `package` and `import` statements.

### Fully qualify imports

Makes it obvious what classes are used and the code is more readable for maintainers.


| Good             | Bad            |
| :--------------- | :------------- |
| `import foo.Bar` | `import foo.*` |

See more info [here](https://source.android.com/source/code-style.html#fully-qualify-imports)

### Order import statements

If you are using an IDE such as Android Studio, you don't have to worry about this because your IDE is already obeying these rules. If not, have a look below.

The ordering of import statements is:

- Android imports
- Imports from third parties (com, junit, net, org)
- java and javax
- Same project imports

To exactly match the IDE settings, the imports should be:

* Alphabetically ordered within each grouping, with capital letters before lower case letters (e.g. Z before a).
* There should be a blank line between each major grouping (android, com, junit, net, org, java, javax).

More info [here](https://source.android.com/source/code-style.html#limit-variable-scope)

### Order class members

There is no single correct solution for this but using a __logical__ and __consistent__ order will improve code learnability and readability. It is recommendable to use the [following order](https://kotlinlang.org/docs/reference/coding-conventions.html#class-layout):

- Constants
- Fields
- Initializer blocks
- Secondary constructors
- Method declarations
- Companion object

### Order parameters in methods

When programming for Android, it is quite common to define methods that take a `Context`. If you are writing a method like this, then the __Context__ must be the __first__ parameter.

The opposite case are __callback__ interfaces that should always be the __last__ parameter.

Examples:

```kotlin
// Context always goes first
fun loadUser(context: Context, userId: Int): User

// Callbacks always go last
fun loadUserAsync(context: Context, userId: Int, callback: UserCallback)
```

### Use spaces for indentation

Use __4 spaces__ for indentation. Do not use tabs.

```kotlin
if (elements != null) {
    for (element in elements) {
        // ...
    }
}
```

Use __8 space__ indents for line wraps:

```kotlin
val i: Instrument =
        someLongExpression(that, wouldNotFit, on, one, line)
```

### Use standard brace style

Braces go on the same line as the code before them.

```kotlin
class MyClass {
    fun myFun() {
        if (something) {
            // ...
        } else if (somethingElse) {
            // ...
        } else {
            // ...
        }
    }
}
```

Braces around the statements are required unless the condition and the body fit on one line.

If the condition and the body fit on one line and that line is shorter than the max line length, then braces are not required, e.g.

```java
if (condition) body()
```

This is __bad__:

```java
if (condition)
    body()  // bad!
```

### Class header formatting

Classes with a few primary constructor parameters can be written in a single line:

```kotlin
class Person(id: Int, name: String)
```

Classes with longer headers should be formatted so that each primary constructor parameter is in a separate line with indentation.
Also, the closing parenthesis should be on a new line. If we use inheritance, then the superclass constructor call or list of implemented interfaces
should be located on the same line as the parenthesis:

```kotlin
class Person(
    id: Int,
    name: String,
    surname: String
) : Human(id, name) { /*...*/ }
```

For multiple interfaces, the superclass constructor call should be located first and then each interface should be located in a different line:

```kotlin
class Person(
    id: Int,
    name: String,
    surname: String
) : Human(id, name),
    KotlinMaker { /*...*/ }
```

For classes with a long supertype list, put a line break after the colon and align all supertype names horizontally:

```kotlin
class MyFavouriteVeryLongClassHolder :
    MyLongHolder<MyFavouriteVeryLongClass>(),
    SomeOtherInterface,
    AndAnotherOne {

    fun foo() { /*...*/ }
}
```

To clearly separate the class header and body when the class header is long, either put a blank line
following the class header (as in the example above), or put the opening curly brace on a separate line:

```kotlin
class MyFavouriteVeryLongClassHolder :
    MyLongHolder<MyFavouriteVeryLongClass>(),
    SomeOtherInterface,
    AndAnotherOne 
{
    fun foo() { /*...*/ }
}
```

Use regular indent (4 spaces) for constructor parameters.

> Rationale: This ensures that properties declared in the primary constructor have the same indentation as properties
> declared in the body of a class.

### Modifiers

If a declaration has multiple modifiers, always put them in the following order:


```kotlin
public / protected / private / internal
expect / actual
final / open / abstract / sealed / const
external
override
lateinit
tailrec
vararg
suspend
inner
enum / annotation
companion
inline
infix
operator
data
```

### Function formatting

If the function signature doesn't fit on a single line, use the following syntax:

```kotlin
fun longMethodName(
    argument: ArgumentType = defaultValue,
    argument2: AnotherArgumentType
): ReturnType {
    // body
}
```

Use regular indent (4 spaces) for function parameters.

> Rationale: Consistency with constructor parameters

Prefer using an expression body for functions with the body consisting of a single expression.

```kotlin
fun foo(): Int {     // bad
    return 1 
}

fun foo() = 1        // good
```

### Expression body formatting

If the function has an expression body that doesn't fit in the same line as the declaration, put the `=` sign on the first line.
Indent the expression body by 4 spaces.


```kotlin
fun f(x: String) =
    x.length
```

### Property formatting

For very simple read-only properties, consider one-line formatting:

```kotlin
val isEmpty: Boolean get() = size == 0
```

For more complex properties, always put `get` and `set` keywords on separate lines:

```kotlin
val foo: String
    get() { /*...*/ }
```

For properties with an initializer, if the initializer is long, add a line break after the equals sign
and indent the initializer by four spaces:


```kotlin
private val defaultCharset: Charset? =
        EncodingRegistry.getInstance().getDefaultCharsetForPropertiesFiles(file)
```

__Break at operators__

When the line is broken at an operator, the break comes __before__ the operator. For example:

```kotlin
val longName = 
       anotherVeryLongVariable 
       + anEvenLongerOne 
       - thisRidiculousLongOne 
       + theFinalOne
       + unexpectedOne
```

__Assignment Operator Exception__

An exception to the `break at operators` rule is the assignment operator `=`, where the line break should happen __after__ the operator.

```kotlin
val longName =
        anotherVeryLongVariable + anEvenLongerOne - thisRidiculousLongOne + theFinalOne
```

### Chained call wrapping

When wrapping chained calls, put the `.` character or the `?.` operator on the next line, with a single indent(4 spaces):

```kotlin
val anchor = owner
    ?.firstChild!!
    .siblings(forward = true)
    .dropWhile { it is PsiComment || it is PsiWhiteSpace }
```

The first call in the chain usually should have a line break before it, but it's OK to omit it if the code makes more sense that way.

```kotlin
Picasso.with(context)
        .load("http://some.website/images/helloworld.jpg")
        .into(imageView)
```


### Control flow statements formatting

If the condition of an `if` or `when` statement is multiline, always use curly braces around the body of the statement.
Indent each subsequent line of the condition by 4 spaces relative to statement begin. 
Put the closing parentheses of the condition together with the opening curly brace on a separate line:


```kotlin
if (!component.isSyncing &&
    !hasAnyKotlinRuntimeInScope(module)
) {
    return createKotlinNotConfiguredPanel(module)
}
```

> Rationale: Tidy alignment and clear separation of condition and statement body


In a `when` statement, if a branch is more than a single line, consider separating it from adjacent case blocks with a blank line:

```kotlin
private fun parsePropertyValue(propName: String, token: Token) {
    when (token) {
        is Token.ValueToken ->
            callback.visitValue(propName, token.value)

        Token.LBRACE -> { // ...
        }
    }
}
```

Put short branches on the same line as the condition, without braces.

```kotlin
when (foo) {
    true -> bar() // good
    false -> { baz() } // bad
}
```

In long argument lists, put a line break after the opening parenthesis. Indent arguments by 4 spaces. 
Group multiple closely related arguments on the same line.


```kotlin
drawSquare(
    x = 10, y = 10,
    width = 100, height = 100,
    fill = true
)
```

Put spaces around the `=` sign separating the argument name and value.
