<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="hf" uri="http://happyf.statcan.ca/taglib"%>

<tiles:importAttribute />

<head>
<hf:base/>
<meta charset="utf-8" />
<!-- Web Experience Toolkit (WET) / Boîte à outils de l'expérience Web (BOEW)
www.tbs.gc.ca/ws-nw/wet-boew/terms / www.sct.gc.ca/ws-nw/wet-boew/conditions -->
<hf:title>
	<s:if test="hasErrors()"><s:text name="statcan.cmp.common.error.pageTitle"/><s:text name="statcan.cmp.common.colon"/>&nbsp;</s:if><s:property value="getText(#attr.KEY_PAGE_HEADING, headingParams)"/> - <s:text name="statcan.cmp.header.site.title"/>
</hf:title>

<link rel="shortcut icon" href="resources/dist/theme-gcwu-fegc/images/favicon.ico" />
<meta name="description" content="<s:text name="statcan.cmp.header.metadata.description	"/>" />
<meta name="dcterms.creator" content="<s:text name="statcan.cmp.header.metadata.creator"/>" />
<meta name="dcterms.title" content="<s:text name="statcan.cmp.header.metadata.title"/>" />
<meta name="dcterms.issued" title="W3CDTF" content="" />
<meta name="dcterms.modified" title="W3CDTF" content="" />
<meta name="dcterms.subject" title="scheme" content="<s:text name='statcan.cmp.header.metadata.keywords'/>" />
<meta name="dcterms.language" title="ISO639-2" content="<s:text name='statcan.cmp.header.metadata.language'/>" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script src="resources/dist/js/jquery.min.js"></script>
<script src="resources/dist/js/jquery-ui.min.js"></script>


<!--[if lte IE 8]>
<script src="resources/dist/js/polyfills/html5shiv-min.js"></script> 
<link rel="stylesheet" href="resources/dist/grids/css/util-ie-min.css" /> 
<link rel="stylesheet" href="resources/dist/js/css/pe-ap-ie-min.css" /> 
<link rel="stylesheet" href="resources/dist/theme-gcwu-fegc/css/theme-ie-min.css" />
<![endif]-->

<!--[if gt IE 8]><!-->
<link rel="stylesheet" href="resources/dist/grids/css/util-min.css" />
<link rel="stylesheet" href="resources/dist/js/css/pe-ap-min.css" />
<link rel="stylesheet"
	href="resources/dist/theme-gcwu-fegc/css/theme-min.css" />

<!--<![endif]-->
<noscript><link rel="stylesheet" href="resources/dist/theme-gcwu-fegc/css/theme-ns-min.css" /></noscript>

<!-- CustomScriptsCSSStart -->

<link href="resources/css/lib/statcan/jquery-ui.css" rel="stylesheet" />

<link href="resources/css/cmp-pgc.css" rel="stylesheet" />
<!--[if IE 8]><!-->
<link href="resources/css/cmp-pgc-ie8.css" rel="stylesheet" />
<!--<![endif]-->
<!--[if IE 7]><!-->
<link href="resources/css/cmp-pgc-ie7.css" rel="stylesheet" />
<!--<![endif]-->
<!--[if lte IE 6]><!-->
<link href="resources/css/cmp-pgc-ie6.css" rel="stylesheet" />
<!--<![endif]-->

<!-- CustomScriptsCSSEnd -->
</head>
