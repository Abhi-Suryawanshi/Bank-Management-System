package com.bankingsystem.common;

import java.io.InputStream;
import java.util.Properties;

public class PropertyReader {
		
	public static String getValueByKeyFromPropFile(String key) {
		String value= null;
		try {
			Properties properties=new Properties();
			InputStream dbstream=PropertyReader.class.getClassLoader().getResourceAsStream("sql.properties");
			properties.load(dbstream);
			value=properties.getProperty(key);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return value;
	}
	
}
