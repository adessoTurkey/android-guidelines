package ${escapeKotlinIdentifiers(rootPackage)}.${packagePathName}.${classNameLowercase}

import android.app.Application
import android.content.Context
import ${escapeKotlinIdentifiers(rootPackage)}.base.BaseAndroidViewModel

import javax.inject.Inject

class ${classNameCap}ViewModel @Inject constructor(context: Context)
    : BaseAndroidViewModel(context.applicationContext as Application)
