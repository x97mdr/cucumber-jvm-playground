<@s.iterator value="parameters.list" status="iteratorStatus">
  <#assign itemValue = stack.findValue(parameters.listValue)/>
  '${itemValue?html}'<#t/>
  <#if iteratorStatus.last == false>
    ,<#t/>
  </#if>
</@s.iterator>