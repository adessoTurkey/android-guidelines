<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    tools:context="${packageName}.${packagePathName}.${classNameLowercase}.${classNameCap}Fragment">

   <data>

       <variable name="viewModel"
           type="${rootPackage}.${packagePathName}.${classNameLowercase}.${classNameCap}ViewModel"/>

   </data>

   <FrameLayout
       android:layout_width="match_parent"
       android:layout_height="match_parent">

   </FrameLayout>

</layout>
