package ca.statcan.icos.sandbox;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ConfigurableWebApplicationContext;
import org.springframework.web.context.ContextLoaderListener;

public class EmbeddedContextLoaderListener extends ContextLoaderListener {
	
	@Override
	protected ApplicationContext loadParentContext(ServletContext servletContext) {
		return ApplicationContextProvider.getApplicationContext();
	}
}
