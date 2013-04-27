package ca.statcan.icos.sandbox;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.AbstractRefreshableApplicationContext;

import ca.statcan.icos.sandbox.web.MyFirstAction;

public class ApplicationContextDumper implements ApplicationContextAware {

	private static final Logger LOG = LoggerFactory
			.getLogger(MyFirstAction.class);

	private Map<String, Integer> beanReferenceCounter = new HashMap<String, Integer>();
	private StringBuilder outputMessage;

	@Override
	public void setApplicationContext(ApplicationContext context)
			throws BeansException {
		outputMessage = new StringBuilder();
		beanReferenceCounter.clear();
		outputMessage.append("--- ApplicationContextDumper begin ---\n");
		dumpApplicationContext(context);
		dumpBeansWithoutReference();
		outputMessage.append("--- ApplicationContextDumper end ---\n");
		LOG.info(outputMessage.toString());
	}

	private void dumpBeansWithoutReference() {
		outputMessage.append("Beans without reference:\n");
		for (String bean : beanReferenceCounter.keySet()) {
			if (beanReferenceCounter.get(bean) == 0) {
				outputMessage.append("  ").append(bean).append('\n');
			}
		}
	}

	private void initBeanReferenceIfNotExist(String beanName) {
		Integer count = beanReferenceCounter.get(beanName);
		if (count == null) {
			beanReferenceCounter.put(beanName, 0);
		}
	}

	private void increaseBeanReference(String beanName) {
		Integer count = beanReferenceCounter.get(beanName);
		if (count == null) {
			count = new Integer(0);
		}
		beanReferenceCounter.put(beanName, ++count);
	}

	private void dumpApplicationContext(ApplicationContext context) {
		// Read context id isn't available.
		// https://jira.springsource.org/browse/SPR-8816
		String appContextInfo = String.format("ApplicationContext %s : %s",
				context.getId(), context.getClass().getName());
		ApplicationContext parent = context.getParent();
		if (parent != null) {
			appContextInfo += String.format(" -> %s", parent.getId());
		}
		outputMessage.append(appContextInfo).append('\n');

		ConfigurableListableBeanFactory factory = ((AbstractRefreshableApplicationContext) context)
				.getBeanFactory();
		for (String beanName : factory.getBeanDefinitionNames()) {
			if (factory.getBeanDefinition(beanName).isAbstract()) {
				continue;
			}
			initBeanReferenceIfNotExist(beanName);
			Object bean = factory.getBean(beanName);
			outputMessage.append(String.format("  %s : %s\n", beanName, bean
					.getClass().getName()));
			for (String dependency : factory.getDependenciesForBean(beanName)) {
				outputMessage.append(String.format("    -> %s\n", dependency));
				increaseBeanReference(dependency);
			}
		}

		if (parent != null) {
			outputMessage.append("Parent:\n");
			dumpApplicationContext(parent);
		}
	}

}
