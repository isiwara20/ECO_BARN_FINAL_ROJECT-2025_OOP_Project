package com.ecobarn.util;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class MyAppContextListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Deregister JDBC drivers
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                System.out.println("Deregistered JDBC driver: " + driver);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        AbandonedConnectionCleanupThread.checkedShutdown();
		System.out.println("MySQL AbandonedConnectionCleanupThread shut down.");
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Nothing needed here for now
    }
}
