
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<s:if test="hasErrors()">

	<div class="cn-error-msg">
	  <h2><s:text name="statcan.fms.common.error.attention"></s:text></h2> 
	<ol>
		<s:set var="counter" value="1"/>
		<s:iterator value="fieldErrors" status="fieldValidation">
		<s:iterator value="value" id="fieldErrorIterator">
		<li><a href="<s:url includeParams="get"/>#<s:property value="key"/>">
			<span class="cn-invisible">
				<s:text name="statcan.fms.common.error.attention"/>&nbsp;<s:property value="#counter"/>:&nbsp; </span>
				<s:property value="fieldErrorIterator"/>
				<s:set var="counter" value="%{1+#counter}"  />
			</a>
		</li>
		  </s:iterator>	
		  </s:iterator>	   
		<s:iterator value="actionErrors" status="validation">
			
			<li>
				<span class="wb-invisible">
					<s:text name="statcan.fms.common.error.attention"/>&nbsp;<s:property value="#counter"/>:&nbsp; 
				</span>
				<s:property escape="false"/>
				<s:set var="counter" value="%{1+#counter}"  />
			</li>
		</s:iterator>	
		<s:iterator value="externalActionErrors" status="validation">
			<li>
			<a href="<s:property value="key"/>">
				<span class="cn-invisible">
					<s:text name="statcan.fms.common.error.attention"/>&nbsp;<s:property value="#counter"/>:&nbsp; 
				</span>
				<s:property value="value" escape="false"/>
				<s:set var="counter" value="%{1+#counter}"  />
			</a>
			</li>
		</s:iterator>					
	
	</ol>
	</div>
	<div class="clear"></div>
</s:if>
<s:if test="hasActionMessages()">
<div class="cn-confirmation-msg">
<h2>
<s:if test="hasCustomizedMessageTitleKey()">
		<s:property value="getText(#attr.customizedMessageTitleKey)" escape="false" />
</s:if>
<s:else>
	<s:text name="statcan.fms.common.message.success"></s:text>
</s:else>
</h2>
<ol>

<s:iterator value="actionMessages">
<li>
	<span class="wb-invisible"><s:text name="statcan.fms.common.message.success"></s:text> 1: </span>
   <s:property escape="false"/>
</li>
</s:iterator>


<s:iterator value="linkActionMessages">
<li><a href="<s:url includeParams="get"/>#<s:property value="key"/>">
		<s:property value="value" escape="false"/>
	</a>
</li>
</s:iterator>

</ol>
</div>
<div class="clear"></div>
</s:if>


