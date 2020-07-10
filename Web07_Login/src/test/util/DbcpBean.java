package test.util;
/*
 *  [Data Base Connection Pool Bean ]
 * 
/*
 * 아래의 클래스가 동작 하려면
 * 1.servers/context.xml 문서에 db 접속 정보가 있어야 한다.
 * 2.web-inf/web.xml이 있어야 한다.
 * 3.web-inf/lib/ojdbc6.jar가 있어야 한다. 
 * 
 * - new DbcpBean().getConn() 메소드를 호출하면 Connection Pool 에서 
	Connection 객체가 하나 리턴된다. 
	
	- Dao 에서 Connection 객체를 사용한후 .close() 메소드를 호출하면 
	  자동으로 Connection Pool 에 Connection 객체가 반환된다.
 */



import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DbcpBean {
	//필드
	private Connection conn;
	
	//생성자
	public DbcpBean() {
		//Connection 객체의 참조값을 얻어와서 필드에 저장하는 작업을 한다.
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			//jdbc/myoracle 이라는 이름의 dataSource에서(Connection Pool)
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			//Connection 객체를 하나 가지고 안다.
			conn = ds.getConnection();
			//etc.
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Connection 객체를 리턴해주는 메소드
	public Connection getConn() {
		return conn;
	}

}
