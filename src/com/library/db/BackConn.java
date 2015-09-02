package com.library.db;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class BackConn {
	public static DataSource ds;
	
	
		
	
	public static Connection getConn(){
		Connection conn=null;
		try {
			conn=ds.getConnection();
			//System.out.println(conn);
			//System.out.println("OK");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	
}
