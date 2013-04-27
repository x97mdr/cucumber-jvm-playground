<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<tiles:useAttribute name="KEY_PAGE_HEADING" scope="request" />
<tiles:useAttribute name="PAGE_HEADING_CLASS" ignore="true"
	scope="request" />

<!DOCTYPE html>
<!--[if IE 7]> <html lang="<s:text name="statcan.cmp.header.metadata.language.abbr"/>" class="no-js ie7"> <![endif]-->
<!--[if IE 8]> <html lang="<s:text name="statcan.cmp.header.metadata.language.abbr"/>" class="no-js ie8"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="<s:text name="statcan.cmp.header.metadata.language.abbr"/>" class="no-js">
<!--<![endif]-->

<tiles:insertAttribute name="head" />

<body>
	<div id="wb-body">
	
	<tiles:insertAttribute name="header" />

	
		<div id="wb-core">
			<div id="wb-core-in" class="equalize">
				<div id="wb-main" role="main">
					<div id="wb-main-in">
						<!-- MainContentStart -->
						<h1 id="wb-cont"
							<s:if test="%{#attr.PAGE_HEADING_CLASS != null}">class='<s:property value="%{#attr.PAGE_HEADING_CLASS}"/>'</s:if>>
							<s:property
								value="getText(#attr.KEY_PAGE_HEADING, headingParams)"
								escape="false" />
						</h1>

						<section>
							<tiles:insertAttribute name="validation" />
							<tiles:insertAttribute name="content" />
						</section>

						<dl id="gcwu-date-mod" role="contentinfo">
							<dt><s:text name = "statcan.cmp.footer.dateModified"/></dt>
							<dd>${buildTimestamp}</dd>
						</dl>
						<div class="clear"></div>
						<!-- MainContentEnd -->
					</div>
				</div>
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>

	<!-- ScriptsStart -->
	<script src="resources/dist/theme-gcwu-fegc/js/theme-min.js"></script>
	<script src="resources/dist/js/settings.js"></script>
	<script src="resources/dist/js/pe-ap-min.js"></script>
	<!-- ScriptsEnd -->
</body>
</html>


