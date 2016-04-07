<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page contentType="text/html; charset=iso-8859-1" session="true" language="java" import="java.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs" lang="cs">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name='author' content='Christian Camilo Callejas Charry' />
<%!String slider;%>

<head>
    <title>Intranet Corporativo</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="SHORTCUT ICON" href="images/Icono_Nikken.ico"></link><!-- Icono de la Pagina -->
    <link rel="stylesheet" type="text/css" href="css/cuerpo/default_1.css" media="screen" /><!-- Estilo de la Pagina -->
    <!--[if IE 6]>
    <link rel="stylesheet" href="css/menu_despegable/ie6.css" type="text/css" media="all" />
    <![endif]-->
    <link rel="stylesheet" href="css/menu_despegable/stencil.menu.css" type="text/css" media="screen" title="no title" charset="utf-8"/><!-- Menu despegable -->
    <link rel="stylesheet" href="css/menu_despegable/stencil.menu.colors.css" type="text/css" media="screen" title="no title" charset="utf-8"/><!-- Menu despegable -->
    <link rel="stylesheet" type="text/css" href="css/menu_lateral/styles.css" /><!-- Menu Lateral -->
    <link href="css/tablecloth/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="css/tablecloth/tablecloth/tablecloth.js"></script>
    <script type="text/javascript" src="js/cuadrev.js"></script>
   
    <!-- Estilo de Burbuja -->
    <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
    
   <link href="css/datatable/jquery-ui-1.8.22.custom.css" rel="stylesheet"/>
   <link href="css/datatable/jquery.dataTables.css" rel="stylesheet" />
   <link href="css/datatable/demo_table.css" rel="stylesheet" />
   <link href="css/datatable/demo_table_jui.css" rel="stylesheet" />
   <link href="css/tablecloth/view.css" rel="stylesheet" type="text/css" media="screen" ></link>
   <link  href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"></link>
   <link rel="stylesheet" href="/resources/demos/style.css"/>
   
    <script src="js/jquery-1.8.2.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/Calendarw.js"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	
		   <script>
		 $(function() {
			    $( "#accordion" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script> <script>
		 $(function() {
			    $( "#accordionOrden" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script><script>
		 $(function() {
			    $( "#accordionRecaudos" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100 
			    });
			  });
		  </script><script>
		 $(function() {
			    $( "#accordionDiferencia" ).accordion({
			      heightStyle: "content",
			      collapsible: true,
			      active: 100
			    });
			  });
		  </script>
    
</head>
    

<body>
<%@include file="importacion.jsp"%>
    <!-- Ubicacion del menu despegable -->
    <style type="text/css">
    .navigation { position: absolute; z-index: 4;  width: 1095px; top: 95px; margin-left: -75px;}
    .page { z-index: 4;}
.exito {
        color: #4F8A10;
		font-size: 12px;
		background-color: #DFF2BF;
		background-image: url('exito.png');
		width: 61%;
		text-align: left;
		margin-left: 0%;
}
.back {
        color: #4F8A10;
		font-size: 12px;
		background-color: #DFF2BF;
		background-image: url('atrasBoton.png');
		width: 61%;
		text-align: left;
		margin-left: 0%;
}
.error {
   		color: #D8000C;
		font-size: 12px;
		background-color: #FFBABA;
		background-image: url('error.png');
		width: 47%;
		margin-left: 18%;
		text-align: left;
}
.info{
	color: #00529B;
	background-color: #BDE5F8;
	background-image: url('infor.png');
	height: 17px;
	width: 56%;
	margin-left: 11%;
	font-size: 12px;
}
    
    .dataTables_wrapper {
			position: relative !important;
	clear: both !important;
	font-size: 95% !important;
	}
   
   .centerText{
   	text-align: center !important;
   }
    </style>
    <div id="view" style="z-index: 3;">
    <div id="head" style="z-index: 3;">
    <div id="main" style="z-index: 3;">
        <img src="images/Logo_Intra2.png"/>
    </div>
    <hr class="hidden" />
    <hr class="hidden" />
    <div id="logo"></div>
    <%
    try{
    	Utilitario obj = new Utilitario();
        ResultSet ds=obj.ObtenerSlider();
         while (ds.next())
         {
              slider = ds.getString("menu_horizontal");  
         }
         %>
         <%=slider %><%
   	 }catch(Exception e){
   		 System.out.println("Ha ocurrido un error al invocar"+
   				 "el menu horizontal a causa de: "+e.toString());
   	 }
    %>
    
    <hr class="hidden"/>
  </div>
  <div id="content" style="width: 100%;margin-top: -1%; margin-left: 0%;">
      <div class="Letra_Intra">
        <div id="contentBlock">
          <div class="item itemOdd">
         	 <span class="date">Nikken Latinoamérica</span>
         	 
         	 <h3>" Resultados Asignación a Comerciantes Independientes de Clientes Finales".</h3>
         	 <%try{
	%>
         	 
         
         	 <fieldset style="margin-left: 0%;width:100%;">
         	 <legend>Resultado</legend>
         	 <form action="" name="fromn1 "method="post">
	         	
	         	<% 
					String mensajeAsignacion ="",operadores="";
	         		Ganador obj = new Ganador();
	         		Prospecto objP = new Prospecto();
	         		
	         		mensajeAsignacion=(String)session.getAttribute("asignarIngreso");
	         		obj=(Ganador)session.getAttribute("objectGanador");
	         		objP=(Prospecto)session.getAttribute("objectoProspecto");
	         		operadores=(String)session.getAttribute("DatosOperadores");
	         		
	         		String v [] = operadores.split("_");
	         		if(mensajeAsignacion!=null){
	         			if(mensajeAsignacion.equals("true_")){
	         				%>
	         				<div id="mayDiferenceDate" class='exito mensajes' style="  width: 73%;margin-left: 4%;">La asignación se realizo con exito !!</div>
	         				<%
	         			}else{
	         				%>
	         				<div id="mayDiferenceDate" class='error mensajes' style="  width: 73%;margin-left: 4%;">ups !! Ha Ocurrido un error. Por favor remite este caso directamente a Tecnologias de la Información </div>
	         				<%
	         			}
	         		}%>
	         		<div id="exito" class='back mensajes'><a href="index.jsp?pais=<%=v[1].toString() %>&nombre=<%=v[0].toString() %>&area=<%=v[2].toString() %>">Volver</a></div>
	         		
	   	         	 <table border="1">
	   	         	 	<tr>
	   	         	 		<td style="background:white;">
	   	         	 		<%if(objP!=null){
	         						%>
								<fieldset style="width:77%;">
         							<legend>Datos Prospecto </legend>
         							<table>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Nombre:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=objP.getNombre() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Pais:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=objP.getPais() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Estado:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=objP.getEstado() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Email:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=objP.getMail() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Telefono:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=objP.getTelefono() %></p></td>
         								</tr>
         							</table>
         						</fieldset>
         						<%} %>	   	         	 		
	   	         	 		</td>
	   	         	 		<td style="background:white;">
							<%if(obj!=null){
	         						%>
								<fieldset style="width:80%;">
         							<legend>Datos AB :</legend>
         							<table>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Codigo Ci:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p ><%=obj.getCodigoci() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Nombre:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=obj.getNombreci() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Pais:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=obj.getPais() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Estado:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=obj.getEstado() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Email:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=obj.getEmail() %></p></td>
         								</tr>
         								<tr>
         									<td style="background-color: white;border-bottom: 1px solid black;"><label style="font-weight: bolder;font-style: italic;">Telefono:</label></td><td style="background-color: white;border-bottom: 1px solid black;"><p><%=obj.getTelefono() %></p></td>
         								</tr>
         							</table>
         						</fieldset>	 
         						<%} %>  	         	 		
	   	         	 		</td>
	   	         	 	</tr>
	   	         	 </table>
	         	
         	 </form>
         	 </fieldset>
         	 	
 		</div>
         </div>
    </div>
  <hr class="hidden" />
  <div id="foot">
    <p class="fl">Nikken Latinoamérica 2015&copy; </p>
        <p class="fr">Desarrollado por: Tecnologias de la Información. - Felipe Cordoba</p>
  </div>
  <%
  %>
</div>
</body>
<%
	}catch(Exception ex){
		%>
			<div id="errors" class='error mensajes' style="width: 278%;" >Ups! Ingreso no valido por favor  intentalo mas tarde <a href="http://intranet.nikkenlatam.com:8080/Intranetlat/">Volver</a></div>
		<%
		System.out.println("error de usuario " + ex.toString());
}%>
</html>