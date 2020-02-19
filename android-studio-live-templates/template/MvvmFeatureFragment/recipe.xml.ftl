<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />

    <#if includeLayout>
        <instantiate from="root/res/layout/fragment_layout.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />
    </#if>

    <instantiate from="root/src/app_package/Fragment.kt.ftl"
    to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Fragment.kt" />

    <instantiate from="root/src/app_package/ViewModel.kt.ftl"
    to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}ViewModel.kt" />

    <#if createModule>
        <instantiate from="root/src/app_package/Module.kt.ftl"
        to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Module.kt" />
    </#if>

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Fragment.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}ViewModel.kt" />

    <#if createModule>
        <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Module.kt" />
    </#if>

    <open file= "${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml" />

</recipe>
