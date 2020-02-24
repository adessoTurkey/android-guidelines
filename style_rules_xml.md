## XML style rules

Inspired by [Ribot Android guideline](https://github.com/ribot/android-guidelines/blob/master/project_and_code_guidelines.md)

### Use self closing tags

When an XML element doesn't have any contents, you __must__ use self closing tags.

This is good:

```xml
<TextView
    android:id="@+id/text_view_profile"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content" />
```

This is __bad__ :

```xml
<!-- Don\'t do this! -->
<TextView
    android:id="@+id/text_view_profile"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content" >
</TextView>
```

### Attributes ordering

As a general rule you should try to group similar attributes together. A good way of ordering the most common attributes is:

- View Id
- Style
- Layout width and layout height
- Other layout attributes, sorted alphabetically
- Remaining attributes, sorted alphabetically
