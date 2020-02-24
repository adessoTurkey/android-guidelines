# Naming convention
Inspired by official [Kotlin conventions](https://kotlinlang.org/docs/reference/coding-conventions.html#naming-rules)

## Packages

Names of packages are always lower case and do not use underscores. Using multi-word names is generally discouraged, but if you do need to use multiple words, you can simply concatenate them.

| Good           			  | Bad   				         |
| :-------------------------- | :--------------------------- |
| `com.adesso.project` 		  | `com.adesso.Project` 		 |
| `com.adesso.awesomeproject` | `com.adesso.awesome_project` |


## Classes

Names of classes and objects start with an upper case letter and use the [CamelCase](http://en.wikipedia.org/wiki/CamelCase).
If classes extend an Android component, the name of the class should end with the name of the component.


```kotlin
data class SomeDataClass { /*...*/ }

class SplashActivity: AppCompatActivity() { /*...*/ }

class LoginErrorDialog: Dialog() { /*...*/ }

```

## Methods & Variables

Names of methods, properties and local variables start with a lower case letter and use the camel case and no underscores.

```kotlin
var someVariable: Int = 1

fun someMethod() { /*...*/ }

```

## Names for backing properties

If a class has two properties which are conceptually the same but one is part of a public API and another is an implementation detail, use an underscore as the prefix for the name of the private property:


```kotlin
class FancyClass {
    private val _elementList = mutableListOf<Element>()

    val elementList: List<Element>
         get() = _elementList
}
```

## Constants

Names of constants starts uppercase underscore-separated. Because many elements of Android SDK use a key-value pair approach,  names of the keys should be defined as const val with an appropriate prefixes.

| Element            | Field Name Prefix   |
| :----------------- | :------------------ |
| SharedPreferences  | `PREF_`             |
| Bundle             | `BUNDLE_`           |
| Fragment Arguments | `ARG_`        	   |
| Intent Extra       | `EXTRA_`            |
| Intent Action      | `ACTION_`           |

```kotlin
const val VALUE_MAX_LOGIN_ATTEMT = 3
val KEY_USER_NAME = "UserName"

var someVariable: Int = 1

fun someMethod() { /*...*/ }

```

If it's needed to define several variables which is related to each other, they should use same prefix that indicates the relation.

```kotlin
const val ENDPOINT_LOGIN = "login"
const val PARAM_LANGUAGE = "lang"
const val PARAM_DATE = "date"
const val PARAM_SEARCH_QUERY = "search_query"
const val DURATION_MS_SESSION_TIMEOUT = 60 * 1000    // 60 sec. -> duration for session timeout in milliseconds
const val DURATION_MS_OPENING_ANIMATION = 300

```


## Acronyms
Treat acronyms as words. When using an acronym as part of a declaration name, capitalize it if it consists of two letters (IOStream); capitalize only the first letter if it is longer.


| Good             | Bad              |
| :--------------- | :--------------- |
| `IOStream` 	   | `IoStream` 	  |
| `XmlHttpRequest` | `XMLHTTPRequest` |
| `getCustomerId`  | `getCustomerID`  |
| `String url`     | `String URL`     |
| `long id`        | `long ID`        |



## Resources

Resources file names are written in __lowercase_underscore__.

### Drawables

Naming conventions for drawables:


> **\<type>\_\<where>\_\<description>** (snake_case)

| Asset Type | Where   		 | Description 		 | Example   							 |
| :--------- | :------------ | :---------------- | :------------------------------------ |
| icon       | search  		 | no result    	 | `ic_search_no_result.xml`  			 |
| divider 	 | common        | list item         | `divider_common_list_item.9.png` 	 |
| shape   	 | common   	 | button background | `shape_common_button_background.xml`  |
| icon    	 | product       | search    		 | `ic_product_search.webp` 		     |
| selector   | search result | campaign  		 | `selector_search_result_campaign.xml` |


Naming conventions for selector states:

| State	       | Suffix          | Example              |
| :----------- | :-------------- | :------------------- |
| Normal       | `_normal`       | `..._normal.webp`    |
| Pressed      | `_pressed`      | `..._pressed.xml`    |
| Focused      | `_focused`      | `..._focused.9.png`  |
| Disabled     | `_disabled`     | `..._disabled.webp`  |
| Selected     | `_selected`     | `..._selected.9.png` |


### Layout files

Layout files should match the name of the Android components that they are intended for but moving the top level component name to the beginning. For example, if we are creating a layout for the `SignInActivity`, the name of the layout file should be `activity_sign_in.xml`.


| Component        | Class Name             | Layout Name                   |
| :--------------- | :--------------------- | :---------------------------- |
| Activity         | `UserProfileActivity`  | `activity_user_profile.xml`   |
| Fragment         | `SignUpFragment`       | `fragment_sign_up.xml`        |
| Dialog           | `ChangePasswordDialog` | `dialog_change_password.xml`  |
| AdapterView item | ---                    | `item_person.xml`             |
| Layout 	 	   | ---                    | `layout_no_result.xml`        |
| Partial layout   | ---                    | `partial_stats_bar.xml`       |

A slightly different case is when we are creating a layout that is going to be inflated by an `Adapter`, e.g to populate a `ListView`. In this case, the name of the layout should start with `item_`.

Note that there are cases where these rules will not be possible to apply. For example, when creating layout files that are intended to be part of other layouts. In this case you should use the prefix `partial_`.


#### ID naming

IDs should be prefixed with the name of the element in lowercase underscore. 
If view binding is enabled, IDs should be written in camelCase with relevant suffix.


No view binding:

| Element         | Prefix           | Example	 				  |
| :-------------- | :--------------- |:-------------------------- |
| `LinearLayout`  | `linear_layout_` | `linear_layout_root`	 	  |
| `TextView`      | `text_view_`     | `text_view_name`			  |
| `ImageView`     | `image_view_`    | `image_view_profile_photo` |
| `Button`        | `button_`        | `button_submit_form`		  |


[View binding](https://developer.android.com/topic/libraries/view-binding) enabled

| Element          | Suffix          | Example	 			   |
| :--------------- | :-------------- |:----------------------- |
| `LinearLayout`   | `LinearLayout`  | `rootLinearLayout` 	   |
| `TextView`       | `TextView`      | `nameTextView`		   |
| `ImageView`      | `ImageView`     | `profilePhotoImageView` |
| `Button`         | `Button`        | `submitFormButton`	   |



#### Strings

String names start with a prefix that identifies the section they belong to. For example `registration_email_hint` or `registration_name_hint`. If a string __doesn't belong__ to any section, then you should follow the rules below:

> **\<where>\_\<what>\_\<description>** (snake_case)


| Where            | Type      | Description              | Example				   			   |
| :--------------- | :-------- | :------------------------| :--------------------------------- |
| common		   | `error`   | Unauthorized Access      | `common_error_unauthorized_access` |
| login			   | `msg`     | Successfully Logged In   | `login_msg_login_succeed`		   |
| forgot password  | `title`   | Forgot Password          | `forgot_passsword_title`	   	   |
| logout 		   | `action`  | Clear All  		 	  | `logout_action_clear_all`		   |



#### Style and Theme

Unlike the rest of resources, style names are written in __[PascalCase (UpperCamelCase)](https://en.wiktionary.org/wiki/Pascal_case)__.


### Menu files

Similar to layout files, menu files should match the name of the component. For example, if we are defining a menu file that is going to be used in the `UserActivity`, then the name of the file should be `activity_user.xml`

A good practice is to not include the word `menu` as part of the name because these files are already located in the `menu` directory.

### Values files

Resource files in the values folder should be __plural__, e.g. `strings.xml`, `styles.xml`.

Resources which __should not be translated__ should be placed in a file named `donottranslate.xml` and `lint` will consider all of them non-translatable resources.


| Common values files    |
| :--------------------- |
| `themes.xml`			 |
| `styles.xml` 			 |
| `strings.xml`  		 |
| `donottranslate.xml`	 |
| `colors.xml`       	 |
| `dimens.xml`       	 |
| `attrs.xml`      	 	 |



# License

```
Copyright 2020 adesso Turkey.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```