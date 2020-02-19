<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
tools:context="${escapeKotlinIdentifiers(packageName)}.${classNameLowercase}.${classNameCap}Activity">

   <data>
       <variable
           name="viewModel"
           type="${escapeKotlinIdentifiers(packageName)}.${classNameLowercase}.${classNameCap}ViewModel" />
   </data>

   <androidx.constraintlayout.widget.ConstraintLayout
       android:layout_width="match_parent"
       android:layout_height="match_parent">

   </androidx.constraintlayout.widget.ConstraintLayout>

</layout>
