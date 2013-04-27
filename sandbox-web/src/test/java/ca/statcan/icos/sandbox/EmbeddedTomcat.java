package ca.statcan.icos.sandbox;

import java.io.File;
import java.io.IOException;

import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.deploy.FilterDef;
import org.apache.catalina.deploy.FilterMap;
import org.apache.catalina.startup.Tomcat;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author camejef
 */
public class EmbeddedTomcat {
	/** Log4j logger for this class. */
	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory
			.getLogger(EmbeddedTomcat.class);

	private Tomcat tomcat;

	public void start() {
		try {
			tomcat = new Tomcat();
			String baseDir = ".";
			tomcat.setPort(8080);
			tomcat.setBaseDir(baseDir);
			tomcat.getHost().setAppBase(baseDir);
			tomcat.getHost().setDeployOnStartup(true);
			tomcat.getHost().setAutoDeploy(true);
			tomcat.enableNaming();

			Context context = tomcat.addContext("/sandbox-web",
					"src\\main\\webapp");
			Tomcat.initWebappDefaults(context);
			configureSimulatedWebXml(context);

			LOG.info("Starting tomcat in: "
					+ new File(tomcat.getHost().getAppBase()).getAbsolutePath());

			tomcat.start();
		} catch (LifecycleException e) {
			throw new RuntimeException(e);
		}
	}

	public void stop() {
		try {
			tomcat.stop();
			tomcat.destroy();
			FileUtils.deleteDirectory(new File("work"));
			FileUtils.deleteDirectory(new File("tomcat.8080"));
		} catch (LifecycleException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public void deploy(String appName) {
		tomcat.addWebapp(tomcat.getHost(), "/" + appName, "src\\main\\webapp");
	}

	public String getApplicationUrl(String appName) {
		return String.format("http://%s:%d/%s", tomcat.getHost().getName(),
				tomcat.getConnector().getLocalPort(), appName);
	}

	public boolean isRunning() {
		return tomcat != null;
	}

	private void configureSimulatedWebXml(final Context context) {
		// Programmatically configure the web.xml here

		context.setDisplayName("Sandbox Web Application");

		context.addParameter(
				"org.apache.tiles.impl.BasicTilesContainer.DEFINITIONS_CONFIG",
				"/WEB-INF/tiles-defs.xml,/WEB-INF/tiles-sandbox.xml");

		final FilterDef struts2Filter = new FilterDef();
		struts2Filter.setFilterName("struts2");
		struts2Filter
				.setFilterClass("org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter");
		struts2Filter.addInitParameter("actionPackages",
				"ca.statcan.icos.sandbox.web");
		context.addFilterDef(struts2Filter);

		final FilterMap struts2FilterMapping = new FilterMap();
		struts2FilterMapping.setFilterName("struts2");
		struts2FilterMapping.addURLPattern("/*");
		context.addFilterMap(struts2FilterMapping);

		context.addApplicationListener("org.apache.tiles.web.startup.TilesListener");
		context.addApplicationListener("ca.statcan.icos.sandbox.EmbeddedContextLoaderListener");

		context.addWelcomeFile("index.jsp");
	}
}
