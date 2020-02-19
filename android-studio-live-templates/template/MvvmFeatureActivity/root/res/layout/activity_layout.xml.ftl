<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    tools:context="${escapeKotlinIdentifiers(packageName)}.${classNameLowercase}.${classNameCap}Activity">

   <data>

       <variable
           name="viewModel"
           type="${rootPackage}.${packagePathName}.${classNameLowercase}.${classNameCap}ViewModel" />

   </data>

   <FrameLayout
       android:layout_width="match_parent"
       android:layout_height="match_parent">

   </FrameLayout>

</layout>
