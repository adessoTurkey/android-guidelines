<#import "root://activities/common/shared_manifest_macros.ftl" as manifestMacros>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application>

        <activity android:name="${rootPackage}.${packagePathName}.${classNameLowercase}.${classNameCap}Activity"
         android:theme="@style/AppTheme" />

    </application>

</manifest>
