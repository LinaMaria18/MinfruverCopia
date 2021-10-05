package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion 
{

	Connection cnn;
	
	
	public Connection conexiondb()
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			
			try 
			{
				cnn=DriverManager.getConnection("jdbc:mysql://localhost/minfruvertienda","root","");
				// jdbc:mysql://127.0.0.1:3306/my_daabase?characterEncoding=UTF8
				
				//JOptionPane.showMessageDialog(null,"Conexion ok");
				
			} catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
						
		} catch (ClassNotFoundException e) 
		{
			
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,"Conexi�n fallida");
		}
		
		return cnn;
		
	}
	
	
}
