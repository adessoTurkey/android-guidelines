package ${escapeKotlinIdentifiers(rootPackage)}.${packagePathName}.${classNameLowercase}

import ${escapeKotlinIdentifiers(rootPackage)}.R
import ${escapeKotlinIdentifiers(rootPackage)}.base.BaseFragment
import ${escapeKotlinIdentifiers(rootPackage)}.databinding.Fragment${classNameCap}Binding

class ${classNameCap}Fragment : BaseFragment<${classNameCap}ViewModel, Fragment${classNameCap}Binding>() {

    override val layoutId = R.layout.${fragmentName}
}
