import java.util.Date;
import java.sql.*;

public class Trans {

	public java.util.Date date;
	
	public static void main(String[] args) {
		
		Trans h = new Trans();
		h.date =new java.util.Date();

		
		
		System.out.println(new java.sql.Date(h.date.getTime())+"");

	}

}
