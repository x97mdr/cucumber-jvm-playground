<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div id="wb-foot">
	<div id="wb-foot-in">
		<footer>
			<h2 id="wb-nav"><s:text name="statcan.cmp.footer.navHeading"/></h2>
			<!-- FooterStart -->
			<nav role="navigation">
				<div id="gcwu-sft">
					<h3><s:text name="statcan.cmp.footer.siteFooter" /></h3>
					<div id="gcwu-sft-in">
						<div id="gcwu-tctr">
							<ul>
								<li class="gcwu-tc"><a href="#" target="_blank"	rel="license"><s:text name="statcan.cmp.footer.termsAndConditions" /></a></li>
								<li class="gcwu-tr"><a href="#" target="_blank"><s:text name="statcan.cmp.footer.transparency" /></a></li>
							</ul>
						</div>
						<div class="clear"></div>
						<div class="span-2">
							<div class="gcwu-col-head">
								<a href="#"><s:text name="statcan.cmp.footer.aboutUs" /></a>
							</div>
						</div>
						<div class="span-2">
							<div class="gcwu-col-head">
								<a href="#"><s:text name = "statcan.cmp.footer.contactUs" /></a>
							</div>
						</div>
					</div>
				</div>
			</nav>

			<nav role="navigation">
				<div id="gcwu-gcft">
					<h3><s:text name = "statcan.cmp.footer.goc.hd" /></h3>
					<div id="gcwu-gcft-in">
						<div id="gcwu-gcft-fip">
							<ul>
								<li><a target="_blank" rel="external"
									href="<s:text name="statcan.cmp.footer.goc.health.href" />"><span><s:text name="statcan.cmp.footer.goc.health" /></span><br /><s:text name="statcan.cmp.footer.goc.health.link" /></a></li>
								<li><a target="_blank" rel="external"
									href="<s:text name="statcan.cmp.footer.goc.travel.href" />"><span><s:text name="statcan.cmp.footer.goc.travel" /></span><br /><s:text name="statcan.cmp.footer.goc.travel.link" /></a></li>
								<li><a target="_blank" rel="external"
									href="<s:text name="statcan.cmp.footer.goc.serviceCanada.href" />"><span><s:text name="statcan.cmp.footer.goc.serviceCanada" /></span><br /><s:text name="statcan.cmp.footer.goc.serviceCanada.link" /></a></li>
								<li><a target="_blank" rel="external"
									href="<s:text name="statcan.cmp.footer.goc.jobs.href" />"><span><s:text name="statcan.cmp.footer.goc.jobs" /></span><br /><s:text name="statcan.cmp.footer.goc.jobs.link" /></a></li>
								<li><a target="_blank" rel="external"
									href="<s:text name="statcan.cmp.footer.goc.economy.href" />"><span><s:text name="statcan.cmp.footer.goc.economy" /></span><br /><s:text name="statcan.cmp.footer.goc.economy.link" /></a></li>
								<li id="gcwu-gcft-ca"><div>
										<a target="_blank" rel="external" href="<s:text name='statcan.cmp.header.goc.canada.link'/>"><s:text name="statcan.cmp.header.goc.canada" /></a>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>
			<!-- FooterEnd -->
		</footer>
	</div>
</div>