<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />

    <#if includeLayout>
        <instantiate from="root/res/layout/activity_layout.xml.ftl"
        to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(activityName)}.xml" />
    </#if>

    <instantiate from="root/src/app_package/Activity.kt.ftl"
    to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Activity.kt" />

    <instantiate from="root/src/app_package/ViewModel.kt.ftl"
    to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}ViewModel.kt" />

    <#if createModule>
        <instantiate from="root/src/app_package/Module.kt.ftl"
        to="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Module.kt" />
    </#if>

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Activity.kt" />

    <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}ViewModel.kt" />

    <#if createModule>
        <open file="${escapeXmlAttribute(srcOutKotlin)}/${pathName}/${classNameLowercase}/${classNameCap}Module.kt" />
    </#if>
    <open file= "${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(activityName)}.xml" />

    <merge from="root/src/AndroidManifest.xml.ftl"
          to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
</recipe>
