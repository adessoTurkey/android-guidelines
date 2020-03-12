package ${escapeKotlinIdentifiers(rootPackage)}.${packagePathName}.${classNameLowercase}

import android.app.Application
import ${escapeKotlinIdentifiers(rootPackage)}.base.BaseAndroidViewModel
import javax.inject.Inject

class ${classNameCap}ViewModel @Inject constructor(application: Application)
    : BaseAndroidViewModel(application)
