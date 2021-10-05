package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import controller.Conexion;


public class UsuariosDAO 
{

	Conexion con= new Conexion();
	Connection cnn=con.conexiondb();
	PreparedStatement ps;
	ResultSet rs;
	UsuariosDTO usu;
	
		

//INGRESAR AL SISTEMA POR BD
public boolean Ingresosistema(UsuariosDTO us) {
	
	try {
		ps = cnn.prepareStatement("SELECT password FROM usuarios WHERE usuario=?");
		ps.setString(1, us.getUsuario());
		rs=ps.executeQuery();
		
		if(rs.next()) {
			if(us.getPassword().equals(rs.getString(1))) {
				return true;
			}
			else {
				return false;
			}
		}
		
	} catch (SQLException e) {
		JOptionPane.showMessageDialog(null, "Error al validar el usuario" + e);
	}
		
	return false;
}
	
	
//INSERTAR UN USUARIO
public boolean insertarusuario(UsuariosDTO us)
{
	
	int x;
	boolean dato=false;
	
	try 
	{
		ps=cnn.prepareStatement("INSERT INTO usuarios VALUES(?,?,?,?,?)");
		ps.setInt(1, us.getCedula_usuario());
		ps.setString(2, us.getEmail_usuario());
		ps.setString(3, us.getNombre_usuario());
		ps.setString(4, us.getPassword());
		ps.setString(5, us.getUsuario());
		
		x=ps.executeUpdate();
		
		if(x>0)
		{
			dato=true;
		}
		
	} catch (SQLException e) 
	{
		JOptionPane.showMessageDialog(null, "Error al insertar usuario"+e);
		e.printStackTrace();
	}
	
	return dato;
	
}

public UsuariosDTO consultarUnUsuario(UsuariosDTO us)
{
	//CONSULTAR UN USUARIO
	
	try 
	{
		ps=cnn.prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario=?");
		ps.setInt(1, us.getCedula_usuario());
		rs=ps.executeQuery();
		
		
		if(rs.next())
		{
			usu=new UsuariosDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			
		}
		else
		{
			
			usu=null;
		}
		
		
		
	} catch (SQLException e) 
	{
		JOptionPane.showMessageDialog(null, "Error al consultar el usuario " + e);
		e.printStackTrace();
		
	}
	
	return usu;
}


	public int eliminarusuario (UsuariosDTO us)
	{
		
		
		
	//ELIMINAR UN USUARIO
	int x=0;
	
	try 
	{
		ps=cnn.prepareStatement("DELETE FROM usuarios WHERE cedula_usuario=?");
		ps.setInt(1, us.getCedula_usuario());
		x=ps.executeUpdate();
		
	} catch (SQLException e) 
	
	{
		
		JOptionPane.showMessageDialog(null, "Error al eliminar el usuario " + e);
		e.printStackTrace();
		
	}
	
	return x;
}

		//ACTUALIZAR USUARIO

	public boolean actualizar(UsuariosDTO us)
	{
		boolean dat=false;
		int x;
		
		try {
		ps=cnn.prepareStatement("UPDATE usuarios SET email_usuario=?, nombre_usuario=?, password=?, usuario=? WHERE cedula_usuario=?");
		ps.setString(1, us.getEmail_usuario());
		ps.setString(2, us.getNombre_usuario());
		ps.setString(3, us.getPassword());
		ps.setString(4, us.getUsuario());
		ps.setInt(5, us.getCedula_usuario());
		
		x=ps.executeUpdate();
			
		if(x>0)
		{
			dat=true;
		}
		} catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return dat;

}
}
