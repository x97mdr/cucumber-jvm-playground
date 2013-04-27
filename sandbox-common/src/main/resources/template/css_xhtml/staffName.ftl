<#if parameters.staff.assignment?exists>
<a href="<@s.url action="myProfile" namespace="/admin">
  <@s.param name="newStaffId">${parameters.staff.id?string("00000000")}</@s.param>
</@s.url>"><#rt />
${parameters.staff.lastAndFirstName?html}</a>
<#else>
${parameters.staff.lastAndFirstName?html}
</#if>