package com.accuweather.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class WeatherDataSource {

	static HikariConfig config;
	static HikariDataSource dataSource;
	
	static {
		config=new HikariConfig();
		config.setUsername("root");
		config.setPassword("mysql");
		
		config.setJdbcUrl("jdbc:mysql://localhost:3306/weather");
		config.setDriverClassName("com.mysql.cj.jdbc.Driver");
		
		
		config.setMaximumPoolSize(10);
		config.setAutoCommit(false);
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
	}
	
	public static HikariDataSource getHikariDs(){
		if(dataSource==null)
			dataSource=new HikariDataSource(config);
		return dataSource;
	}
	
	
}
