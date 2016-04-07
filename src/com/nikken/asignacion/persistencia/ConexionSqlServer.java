package com.nikken.asignacion.persistencia;


 import java.sql.*;

import javax.swing.JOptionPane;
 
public class ConexionSqlServer {
	
	private java.sql.Connection con = null;
	Statement stmt =null;
	ResultSet rs = null;
    private final String url = "jdbc:sqlserver://";
    private final String userName = "sa";
    private final String password = "B1Admin";
    
    // Indica al controlador que debe utilizar un cursor de servidor, // lo que permite más de una instrucción activa // en una conexión.
    private final String selectMethod = "cursor";

    // Constructor public Connect(){}
    private String getConnectionUrl(String serverName, String databaseName) {
        return url + serverName + ";databaseName=" + databaseName + ";selectMethod=" + selectMethod + ";";
    }

    private java.sql.Connection getConnection(String serverName, String databaseName) {
        try {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = java.sql.DriverManager.getConnection(getConnectionUrl(serverName,databaseName), userName, password);
            if (con != null) {
                System.out.println("Conexión correcta.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error de seguimiento en getConnection() : " + e.getMessage());
        }
        return con;
    }

    /* Mostrar las propiedades del controlador y los detalles de la base de datos */
    public void displayDbProperties(String serverName, String databaseName) {
        java.sql.DatabaseMetaData dm = null;
        java.sql.ResultSet rs = null;
        try {
            con = this.getConnection( serverName, databaseName);
            if (con != null) {
                dm = con.getMetaData();
                System.out.println("Información del controlador");
                System.out.println("\tNombre del controlador: " + dm.getDriverName());
                System.out.println("\tVersión del controlador: " + dm.getDriverVersion());
                System.out.println("\nInformación de la base de datos ");
                System.out.println("\tNombre de la base de datos: " + dm.getDatabaseProductName());
                System.out.println("\tVersión de la base de datos: " + dm.getDatabaseProductVersion());
                System.out.println("Catálogos disponibles ");
                rs = dm.getCatalogs();
                while (rs.next()) {
                    System.out.println("\tcatálogo: " + rs.getString(1));
                }
                rs.close();
                rs = null;
                closeConnection();
            } else {
                System.out.println("Error: No hay ninguna conexión activa");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        dm = null;
    }

    private void closeConnection() {
        try {
            if (con != null) {
                con.close();
            }
            con = null;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception {
        ConexionSqlServer myDbTest = new ConexionSqlServer();
        String serverName="", databaseName="";
        myDbTest.displayDbProperties(serverName,databaseName);
    }
    
    public boolean Execute (String Cadena,String database, String servername)
    {
    try
    {// Carga el driver sqljdbc 
       
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     
        con = this.getConnection(servername, database);
     
        stmt =con.createStatement();
       
        stmt.executeUpdate(Cadena);
     
        return true;
    }
    catch
    (Exception e)
    {
        JOptionPane.showMessageDialog(null,"miss"+e);
        return false;

    }
    }

    public ResultSet Consulta (String Cadena, String database, String servername)
    {
    try
    {
    con = this.getConnection(servername, database);
     String SQL =Cadena;//consulta a la base de datos 
     stmt = con.createStatement();// objeto para el envío de sentencias SQL para labase de datos. 
     rs = stmt.executeQuery(SQL);//ejecuta la sentencia de la base de datos
    }
    catch 
    (Exception e){JOptionPane.showMessageDialog(null,"miss"+e+Cadena+database);}
    return rs;
    }
}
