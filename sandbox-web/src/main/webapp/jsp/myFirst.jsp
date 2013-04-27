<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="d" uri="http://displaytag.sf.net"%>

<h2 id="name">
	<s:text name="ca.statcan.icos.sandbox.employee"></s:text>
</h2>

<d:table name="employees" id="employee">
	<d:column scope="col" titleKey="ca.statcan.icos.sandbox.id">
		<s:property value="#attr.employee.id" />
	</d:column>
	<d:column scope="col" titleKey="ca.statcan.icos.sandbox.firstName">
		<s:property value="#attr.employee.firstName" />
	</d:column>
	<d:column scope="col" titleKey="ca.statcan.icos.sandbox.lastName">
		<s:property value="#attr.employee.lastName" />
	</d:column>
	<d:column scope="col" titleKey="ca.statcan.icos.sandbox.birthDate">
		<s:property value="#attr.employee.birthDate" />
	</d:column>
	<d:column scope="col" titleKey="ca.statcan.icos.sandbox.cellPhone">
		<s:property value="#attr.employee.cellPhone" />
	</d:column>

</d:table>