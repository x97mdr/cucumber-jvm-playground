<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="hf" uri="http://happyf.statcan.ca/taglib"%>


<div id="wb-skip">
	<ul id="wb-tphp">
		<li id="wb-skip1"><a href="#wb-cont"><s:text
					name="statcan.cmp.header.skip.content.main" /></a></li>
		<li id="wb-skip2"><a href="#wb-nav"><s:text
					name="statcan.cmp.header.skip.content.footer" /></a></li>
	</ul>
</div>

<div id="wb-head">
	<div id="wb-head-in">
		<header>
			<!-- HeaderStart -->
			<nav role="navigation">
				<div id="gcwu-gcnb">
					<h2>
						<s:text name="statcan.cmp.header.goc.nav" />
					</h2>
					<div id="gcwu-gcnb-in">
						<div id="gcwu-gcnb-fip">
							<div id="gcwu-sig">
								<div id="gcwu-sig-in">
									<div id="<s:text name='statcan.cmp.header.gcwu-sig'/>"
										title="<s:text name="statcan.cmp.header.goc.sig"/>">
										<img src="<s:text name='statcan.cmp.image.signature'/>"
											width="214" height="20"
											alt="<s:text name="statcan.cmp.header.goc.sig"/>" />
									</div>
								</div>
							</div>
							<ul>
								<li id="gcwu-gcnb1"><a target="_blank" rel="external"
									href="<s:text name = 'statcan.cmp.header.goc.canada.link'/>"><s:text
											name='statcan.cmp.header.goc.canada' /></a></li>
								<li id="gcwu-gcnb2"><a target="_blank" rel="external"
									href="<s:text name = 'statcan.cmp.header.goc.services.link'/>"><s:text
											name='statcan.cmp.header.goc.services' /></a></li>
								<li id="gcwu-gcnb3"><a target="_blank" rel="external"
									href="<s:text name = 'statcan.cmp.header.goc.departments.link'/>"><s:text
											name="statcan.cmp.header.goc.departments" /></a></li>
								<li id="gcwu-gcnb-lang"><a
									href="<s:url includeParams="get"><s:param name="request_locale" value="%{getText('statcan.cmp.header.goc.locale')}"/></s:url>"
									lang="<s:text name='statcan.cmp.header.goc.htmllocale'/>"><s:text
											name='statcan.cmp.header.goc.toggle.label' /></a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>

			<div id="gcwu-bnr" role="banner">
				<div id="gcwu-bnr-in">
					<div id="gcwu-wmms">
						<div id="gcwu-wmms-in">
							<div id="gcwu-wmms-fip"
								title="<s:text name="statcan.cmp.header.goc.symbol"/>">
								<img src="resources/dist/theme-gcwu-fegc/images/wmms.gif"
									width="126" height="30"
									alt="<s:text name="statcan.cmp.header.goc.symbol"/>" />
							</div>
						</div>
					</div>
					<div id="gcwu-title">
						<p id="gcwu-title-in">
							<a href="#"><s:text name="statcan.cmp.header.site.title" /></a>
						</p>
					</div>

					<section role="search">
						<div id="gcwu-srchbx">
							<h2>
								<s:text name="statcan.cmp.header.goc.search" />
							</h2>
							<s:form action="searchCMP" method="post">
								<div id="gcwu-srchbx-in">
									<label for="gcwu-srch"><s:text
											name="statcan.cmp.header.goc.search.label" /></label>
									<s:textfield id="gcwu-srch" theme="simple" name="searchTerm"
										size="27" maxlength="150" />
									&nbsp;
									<s:submit theme="simple" method="submit" id="gcwu-srch-submit"
										name="gcwu-srch-submit" data-icon="search"
										value='%{getText("statcan.cmp.header.goc.search")}' />
								</div>
							</s:form>
						</div>
					</section>
				</div>
			</div>

			<nav role="navigation">
				<div id="gcwu-psnb">
					<h2>
						<s:text name="statcan.cmp.header.hd.sitemenu" />
					</h2>
					<div id="gcwu-psnb-in">
						<div class="wet-boew-menubar mb-mega">
							<div>
								<ul class="mb-menu">
								
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div id="gcwu-bc">
					<h2>
						<s:text name="statcan.happyf.header.breadcrumb" />
					</h2>
					<div id="gcwu-bc-in">
						<hf:breadccrumb />
					</div>
				</div>
			</nav>
			<!-- HeaderEnd -->
		</header>
	</div>
</div>