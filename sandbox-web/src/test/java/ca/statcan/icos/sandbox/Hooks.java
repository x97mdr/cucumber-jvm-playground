package ca.statcan.icos.sandbox;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class Hooks {
    private static EmbeddedTomcat tomcat = new EmbeddedTomcat();

    @PersistenceContext
    public EntityManager entityManager;

    @Autowired
    public PlatformTransactionManager transactionManager;

    private void executeSql(String queryText) {
        Query query = entityManager.createNativeQuery(queryText);
        query.executeUpdate();
    }

    @Before(order = 2)
    public void startupTomcat() {
        if (tomcat != null && !tomcat.isRunning()) {
            tomcat.start();

            Runtime.getRuntime().addShutdownHook(new Thread() {
                public void run() {
                    tomcat.stop();
                }
            });
        }


    }

    @Before(value = "@txn", order = 100)
    public void cleanDatabase() {
        executeSql("SET REFERENTIAL_INTEGRITY FALSE");
        executeSql("TRUNCATE TABLE EMPLOYEES");
        executeSql("SET REFERENTIAL_INTEGRITY FALSE");
    }
}
