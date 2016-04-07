package com.nikken.asignacion.impl;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.csvreader.CsvReader;
import com.nikken.asignacion.persistencia.Conexion;
import com.nikken.asignacion.persistencia.ConexionSqlServer;
import com.nikken.asignacion.util.Constantes;
import com.nikken.asignacion.util.Utilitario;
import com.nikken.asignacion.model.Estados;
import com.nikken.asignacion.model.Ganador;

public class AsignacionImpl {

	public static List<Estados> TraerEstados(String pais){
		List<Estados> lstResult= new ArrayList<Estados>();
		
		String servername="";
		String database="";
		String cadena="";
		
		if(pais.equals(Constantes.col)){
			servername=Constantes.host_col;
			database=Constantes.db_col;
			cadena="Select code,name from OCST where country ='CO'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de COL");
			}
		}
		
		if(pais.equals(Constantes.mex)){
			servername=Constantes.host_lat_gtm_slv;
			database=Constantes.db_mex;
			cadena="Select code,name from OCST where country ='MX'and code!='DGO' and code!='HID'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de MEX");
			}
		}
		
		if(pais.equals(Constantes.gtm)){
			servername=Constantes.host_lat_gtm_slv;
			database=Constantes.db_gtm;
			cadena="Select code,name from OCST where country ='GT' "+
						"and code!='1' and code!='11' and code!='13' and code!='14' and code!='15' and code!='16'and code!='17' "+
						"and code!='10' and code!='18' and code!='19' and code!='2' and code!='10' and code!='21'and code!='22' "+
						"and code!='3' and code!='4' and code!='5' and code!='6' and code!='7' and code!='8'and code!='9' "+
						"and code!='12' and code!='20'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de GTM");
			}
		}
		
		if(pais.equals(Constantes.cri)){
			servername=Constantes.host_cri_pan_per_ecu;
			database=Constantes.db_cri;
			cadena="Select code,name from OCST where country ='CR'and code!='1' and code!='2' and code!='3' and code!='4' and code!='5' and code!='6'and code!='7'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de CRI");
			}
		}
		
		if(pais.equals(Constantes.ecu)){
			servername=Constantes.host_cri_pan_per_ecu;
			database=Constantes.db_ecu;
			cadena="Select code,name from OCST where country ='EC'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de ECU");
			}
		}
		
		if(pais.equals(Constantes.per)){
			servername=Constantes.host_cri_pan_per_ecu;
			database=Constantes.db_per;
			cadena="Select code,name from OCST where country ='PE'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de ECU");
			}
		}
		
		if(pais.equals(Constantes.slv)){
			servername=Constantes.host_lat_gtm_slv;
			database=Constantes.db_slv;
			cadena="Select code,name from OCST where country ='SV'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de ECU");
			}
		}
		
		if(pais.equals(Constantes.pan)){
			servername=Constantes.host_cri_pan_per_ecu;
			database=Constantes.db_pan;
			cadena="Select code,name from OCST where country ='PA'";
			ConexionSqlServer obj = new ConexionSqlServer();
			ResultSet rst = obj.Consulta(cadena, database, servername);
			try {
				while(rst.next()){
					Estados objEstados= new Estados();
					objEstados.setCode(rst.getObject(1).toString());
					objEstados.setName(rst.getObject(2).toString());
					lstResult.add(objEstados);
				}
			} catch (SQLException e) {
				System.out.println("Ha ocurrido un error al intentar atrapar los estados de ECU");
			}
		}
		
		Estados objEstados= new Estados();
		objEstados.setCode("EDSAP");
		objEstados.setName("EL DATO ES NULO EN SAP");
		lstResult.add(objEstados);
		return lstResult;
		
	}
		
	public static String TraerNombre_By_Ci(String ci){
		String nombre="";
		String cadena="select nombreci,codigoci from ganadoriso where codigoci like '%"+ci+"%' limit 1";
		Conexion con = new Conexion();
		ResultSet ds=con.Consultar(cadena, Constantes.db_asiggned, Constantes.host);
		
		try{
			while(ds.next()){
				nombre =ds.getString("nombreCi")+"_"+ds.getString("codigoci");
			}
		}catch(Exception ex){
			
		}
		return nombre;
		
	}
	
	public static List<Ganador> traerGanadoresPorPais(String pais){
		List<Ganador> lstResult = new ArrayList<Ganador>();
		String cadena="select * from ganadoriso where pais='"+pais+"' order by vgp desc";
		
		Conexion con = new Conexion();
		ResultSet ds=con.Consultar(cadena, Constantes.db_asiggned, Constantes.host);
		
		try{
			while(ds.next()){
				Ganador obj= new Ganador();
				obj.setCodigoci(ds.getString("codigoci"));
				obj.setNombreci(ds.getString("nombreci"));
				obj.setPais(ds.getString("pais"));
				obj.setEstado(ds.getString("estado"));
				obj.setRango(ds.getString("rango"));
				obj.setEmail(ds.getString("email"));
				obj.setTelefono(ds.getString("telefono"));
				obj.setVgp(ds.getString("vgp"));
				lstResult.add(obj);
			}
		}catch(Exception ex){
			System.out.println(ex.toString());
		}
		return lstResult ;
		
	}
	
	public static List<Ganador> validarGanadoresEstado(List<Ganador> lista,String estado){
		List<Ganador> lstResult = new ArrayList<Ganador>();
		
		try{
			for(Ganador object : lista){
				if(object.getEstado().equalsIgnoreCase(estado) == true){
					System.out.println( object.getEstado() +"  Vs  "+estado);
					lstResult.add(object);
				}
			}
		}catch(Exception ex){
			System.out.println(ex.toString());
		}
		return lstResult ;
		
	}
	
	public static Ganador validarGanadoresMenorCantidad(List<Ganador> lista){
		
		Ganador obj = new Ganador();
		boolean validador =false;
		try{
			for(Ganador object : lista){
				if( Long.parseLong(object.getCantidadAsignado()) < Long.parseLong(lista.get(0).getCantidadAsignado())){
					validador=true;
					obj.setCodigoci(object.getCodigoci());
					obj.setNombreci(object.getNombreci());
					obj.setEmail(object.getEmail());
					obj.setPais(object.getPais());
					obj.setEstado(object.getEstado());
					obj.setRango(object.getRango());
					obj.setTelefono(object.getTelefono());
					obj.setVgp(object.getVgp());
					return obj ;
				}
			}
			if(validador==false){
				obj=lista.get(0);
			}
		}catch(Exception ex){
			System.out.println(ex.toString());
		}
		return obj ;
		
	}
	
	public static int traerTotalDatos(){
		int size=0;
		String consulta ="select count(*) as total from ganadoriso";
		Conexion con = new Conexion();
		ResultSet ds = con.Consultar(consulta, Constantes.db_asiggned, Constantes.host);
		try{
			while(ds.next()){
				size=ds.getInt("total");
			}
		}catch(Exception ex){
			
		}
		return size;
	}
	
	public static Ganador obtenerGanadorPorCodigo(String cardcode){
		
		Ganador obj = new Ganador();
		Conexion con = new Conexion();
		ResultSet ds = con.Consultar("Select * from ganadoriso where codigoci = "+cardcode+"", Constantes.db_asiggned, Constantes.host);
		try{
			while(ds.next()){
				obj.setCodigoci(ds.getString("codigoci"));
				obj.setNombreci(ds.getString("nombreci"));
				obj.setPais(ds.getString("pais"));
				obj.setEstado(ds.getString("estado"));
				obj.setRango(ds.getString("rango"));
				obj.setEmail(ds.getString("email"));
				obj.setTelefono(ds.getString("telefono"));
				obj.setVgp(ds.getString("vgp"));
			}
		}catch(Exception ex){
			System.out.println(ex.toString());
		}
		return obj ;
		
	}
	
	public static long cantidadASignadosPorciAB(String cardcode, String  trimestre){
		long count=0;
		String cadena="select ifnull(cantidadsignado,0) as Cantidad  from ganadoriso_historico where codigoci = '"+cardcode+"' ";
//		String cadena="select ifnull(cantidadsignado,0) as Cantidad  from ganadoriso_historico where codigoci = '"+cardcode+"' and trimestrecargado = '"+trimestre+"'";
		Conexion con = new Conexion();
		ResultSet ds=con.Consultar(cadena, Constantes.db_asiggned, Constantes.host);
		
		try{
			while(ds.next()){
				count =ds.getLong("Cantidad");
			}
		}catch(Exception ex){
			
		}
		return count;
	}
	
	public static boolean asignarProspecto(String nombreP,String correo,String pais,String estado,String telefono,String nombreAB,String codigoAB,String staffNombre,String fechaActual){
		Conexion con = new Conexion();
		
		String cadena="insert into prospecto (nombre, correo, pais, estado, telefono, NombreCi, CodigoCi, staffNombre, fechaAsignacion) "
				+ "values('"+nombreP+"','"+correo+"','"+pais+"','"+estado+"','"+telefono+"','"+nombreAB+"','"+codigoAB+"','"+staffNombre+"','"+fechaActual+"')";
		boolean validacion =false;
		validacion = con.Execute(cadena, Constantes.db_asiggned, Constantes.host);
		Calendar date = GregorianCalendar.getInstance();
		int año = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH)+1;
		
		String trimestre="";
		
		if(month==1||month==2||month==3){
			trimestre=año+" Primer Trimestre";
		}if(month==4||month==5||month==6){
			trimestre=año+" Segundo Trimestre";
		}if(month==7||month==8||month==9){
			trimestre=año+" Tercer Trimestre";
		}if(month==10||month==11||month==12){
			trimestre=año+" Cuarto Trimestre";
		}
		long cantidadasignaciones = cantidadASignadosPorciAB(codigoAB,trimestre)+1;
		if(validacion ==true){
			String cadena2 =" update ganadoriso_historico set  cantidadsignado = "+cantidadasignaciones+" where codigoci ='"+codigoAB+"'";
//			String cadena2 =" update ganadoriso_historico set  cantidadsignado = "+cantidadasignaciones+" where codigoci ='"+codigoAB+"' and trimestrecargado ='"+trimestre+"'";
			validacion = con.Execute(cadena2, Constantes.db_asiggned, Constantes.host);
		}
		
		return validacion;
	}
	
	public static List<Ganador> leerGanador ()  throws FileNotFoundException {

 		List<Ganador> lst = new ArrayList<Ganador>();
 		//Le pasamos la URL del archivo CSV a leer.
 		CsvReader reader = new CsvReader("C:\\report\\subidaGanadores.csv");
 		
 		try {
 			long count=0;
	 		while (reader.readRecord())
	 		{
	 			if(count>0){
	 			
		 		
		 			String id = reader.get(0).toString();
			 		String nombre = reader.get(1);
			 		String pais = reader.get(2);
			 		String estado = reader.get(3);
			 		String rango = reader.get(4);
			 		String email = reader.get(5);
			 		String telefono = reader.get(6);
			 		String vgp = reader.get(7);
			 		
			 		if(id.equals("")){
			 			break;
			 		}
			 		
			 		Ganador objR= new Ganador();
			 		objR.setCodigoci(id.replace("'",""));
			 		objR.setNombreci(nombre.replace("'",""));
			 		objR.setPais(pais.replace("'",""));
			 		objR.setEstado(estado.replace("'",""));
			 		objR.setRango(rango.replace("'",""));
			 		objR.setEmail(email.replace("'",""));
			 		objR.setTelefono(telefono.replace("'",""));
			 		objR.setVgp(vgp.replace("'",""));
			 		
			 		lst.add(objR);
			 		
		 		}
	 			
		 		count++;
	 		}
 		} catch (IOException e) {
 			System.out.println(e.toString());
 		}

 		reader.close();
 		return lst;

 	}

	public static boolean InserccionGanadores(List<Ganador> lista){
		Conexion con = new Conexion();
		boolean v= false;
		String cadena=" ";
		
		cadena += "  insert into ganadoriso (codigoci,nombreci,pais,estado,rango,email,telefono,vgp) value ";
		for(Ganador oj : lista){
			cadena+=" ('"+oj.getCodigoci()+"','"+oj.getNombreci()+"','"+oj.getPais()+"','"+oj.getEstado()+"','"+oj.getRango()+"','"+oj.getEmail()+"','"+oj.getTelefono()+"',"+oj.getVgp()+"),"; 
		}
		
		String consulta = cadena.substring(0, cadena.length()- 1); 
		v = con.Execute(consulta+";",Constantes.db_asiggned,Constantes.host);
		
		return v;
	}
	
	public static boolean InserccionGanadoresHistorico(List<Ganador> lista){
		Conexion con = new Conexion();
		boolean v= false;
		String cadena=" ";
		
		Calendar date = GregorianCalendar.getInstance();
		int año = date.get(Calendar.YEAR);
		int month = date.get(Calendar.MONTH)+1;
		
		String trimestre="";
		
		if(month==1||month==2||month==3){
			trimestre=año+" Primer Trimestre";
		}if(month==4||month==5||month==6){
			trimestre=año+" Segundo Trimestre";
		}if(month==7||month==8||month==9){
			trimestre=año+" Tercer Trimestre";
		}if(month==10||month==11||month==12){
			trimestre=año+" Cuarto Trimestre";
		}
		
		
		System.out.println("Tamaño Lsiat Inserccion"+lista.size());
		cadena += "  insert into ganadoriso_historico (codigoci,nombreci,pais,estado,rango,email,telefono,vgp,trimestrecargado,cantidadsignado) value ";
		for(Ganador oj : lista){
			cadena+=" ('"+oj.getCodigoci()+"','"+oj.getNombreci()+"','"+oj.getPais()+"','"+oj.getEstado()+"','"+oj.getRango()+"','"+oj.getEmail()+"','"+oj.getTelefono()+"',"+oj.getVgp()+",'"+trimestre+"',0),"; 
		}
		
		String consulta = cadena.substring(0, cadena.length()- 1); 
		v = con.Execute(consulta+";",Constantes.db_asiggned,Constantes.host);
		
		return v;
	}

	public static boolean BorrarGanadores(){
		Conexion con = new Conexion();
		String consulta ="truncate  ganadoriso;";
		boolean v = con.Execute(consulta, Constantes.db_asiggned, Constantes.host);
		return v;
	}
	
	public static ResultSet traerReporteGanadoresAsginados (String fechain, String fechafn){
		
		String cadena="select t0.codigoci as 'CodigoAB', t0.nombreci as 'Nombre AB', t0.rango as 'RangoAB', t0.pais as 'PaisAB',t0.estado as 'EstadoAB', "
				+ "t1.nombre as 'Nombre Prospecto', t1.pais as 'Pais Prospecto', t1.estado as 'Estado Prospecto', t1.fechaAsignacion as 'Fechas Asignacion', t1.StaffNombre as 'operador' "
				+ " from ganadoriso_historico T0, prospecto T1 where T0.cantidadsignado > 0 and T0.CodigoCi = T1.CodigoCi  and T1.fechaAsignacion >= '"+fechain+"' "
				+ "and fechaAsignacion <= '"+fechafn+"' ;";
		Conexion con = new Conexion();
		return con.Consultar(cadena, Constantes.db_asiggned, Constantes.host);
		
	}
}
