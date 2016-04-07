package com.nikken.asignacion.persistencia;

import java.sql.*;
import javax.swing.JOptionPane;
public class Conexion {

	  String sDriver = "com.mysql.jdbc.Driver";
	   PreparedStatement stmt;
	   Statement scSQL;
	   ResultSet rs;
	   Connection con;
	   String cadena;
	   String usu = "root";
	   String contra = "Jlpmx10";
	   Boolean certif = false;
	   
	   public Boolean Execute (String Cadena,String db, String host)
	   {
	       try
	       {
	    	 
	    	  String sURL = "jdbc:mysql://"+host+"/"+db; 
	          cadena =Cadena;
	          Class.forName(sDriver).newInstance();
	          con = DriverManager.getConnection(sURL,usu ,contra);
	          stmt =con.prepareStatement(cadena);
	          stmt.executeUpdate();
	          certif = true;
	          
	       }
	       catch(Exception e)
	       {
	           certif = false;
	           System.out.println("Error"+cadena);  
	           
	       }
	   return certif;
	   }
	   
	   public ResultSet Consultar( String cadena,String db, String host)
	   {
	       try
	       {
	    	  String sURL = "jdbc:mysql://"+host+"/"+db; 
	          Class.forName(sDriver).newInstance();
	          con = DriverManager.getConnection(sURL,usu ,contra);
	          scSQL = con.createStatement();
	          rs=scSQL.executeQuery(cadena);
	          
	       }
	       catch(Exception e)
	       {
	           JOptionPane.showMessageDialog(null,"error"+e);
	       }
	       return rs;
	       
	   }
}
