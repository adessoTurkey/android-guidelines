<?xml version="1.0"?>
<globals>
    <#assign useSupport=(minApiLevel lt 23)>
    <global id="srcOutKotlin" value="app/src/main/kotlin/${slashedPackageName(rootPackage)}" />
    <global id="useSupport" type="boolean" value="${useSupport?string}" />
    <global id="SupportPackage" value="${useSupport?string('.support.v4','')}" />
    <global id="resOut" value="${resDir}" />
    <global id="srcOut" value="${srcDir}/${slashedPackageName(packageName)}" />
    <global id="relativePackage" value="<#if relativePackage?has_content>${relativePackage}<#else>${rootPackage}</#if>" />
    <global id="hasNoActionBar" type="boolean" value="false" />
    <global id="parentActivityClass" value="" />
    <global id="excludeMenu" type="boolean" value="true" />
    <global id="generateActivityTitle" type="boolean" value="false" />
    <#include "../../activities/common/common_globals.xml.ftl" />
</globals>
