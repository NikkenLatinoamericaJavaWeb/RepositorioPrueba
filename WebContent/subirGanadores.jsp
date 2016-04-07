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
         	 
         	 <h3>"Subir Ganadores ISO".</h3>
         	 <%try{
			%>
         	 <fieldset style="margin-left: 0%;width:100%;">
         	 <legend></legend>
         	 <form method="post" action="uploadFile" name="estimado_form" onsubmit="return validarGrupo(this)" enctype="multipart/form-data">
         	 	<table>
         	 		<tr>
         	 			
         	 			<td style="background-color:white;">
         	 				<div id="info" class='info mensajes' style="width: 80%;margin-left: 0%;">Al realizarse la importacion del archivo, se reiniciara el conteo de asignaciones.</div>
         	 				<h3>Tenga en Cuenta que:</h3>
         	 				<ul>
         	 					<li>El archivo debe tener una extension .CSV o .XLS o .XLSX</li>
         	 					<li>El archivo debe cargarse de manera trimestral</li>
         	 					<li>Al cargarse el archivo le notificara el estado de las operaciones realizadas</li>
         	 					<li>El proceso puede tomar entre 2 a 5 minutos</li>
         	 				</ul>
         	 				<label><input type="file" name="uploadfile" id="file_up"  style="width:90%;"/></label>
         	 			</td>
         	 		</tr>
         	 		<tr>
         	 			<td style="background-color:white;">
         	 				<input type="button" value="Enviar Información" onclick="subirArchivo()"/>
         	 			</td>
         	 		</tr>
         	 	</table>
	         	 <div style="display:none">
					<input type="submit" id="enviarestim" value="Validar datos" style="width:143%;margin-left: -14%;"/>
				</div>
        	 </form>
        	 </fieldset>
        	 <div id="NoPermitido" style="width: 100%;display:none;" class='error mensajes' >Ups! El Archivo seleccionado no tiene el formato  correcto </div>
			<%
			String permitido = "",eliminacion="",ingreso="";
			permitido=(String)session.getAttribute("ExitoArchivo");
			eliminacion =(String)session.getAttribute("eliminacionExitoso");
			ingreso = (String)session.getAttribute("ingresoExitoso");
			
	        if(permitido!=null){
				if(permitido.equals("si")){
					%><div id="Permitido" class='exito mensajes' style="width: 100%;margin-left: 20%;">El Archivo ha sido procesado correctamente!</div><%
				}else{
					%><div id="Permitido" class='error mensajes' style="width: 100%;margin-left: 20%;">Ups!  El Archivo no ha sido procesado con exito!</div><%
				}
				session.setAttribute("ExitoArchivo", null);
			}
	        
	        if(eliminacion!=null){
				if(eliminacion.equals("true_")){
					%><div id="eliminacion" class='exito mensajes' style="width: 100%;margin-left: 20%;">La sustitución de los registros anteriores se realizo con exito!</div><%
					%><div id="info_" class='info mensajes' style="width: 100%;margin-left: 20%;">El Conteo de asignaciones ha sido reiniciado.</div><%
				}else{
					%><div id="eliminacion" class='error mensajes' style="width: 100%;margin-left: 20%;">Ocurrio un Error intentado sustituir los Registros Anteriores!</div><%
				}
				session.setAttribute("eliminacionExitoso", null);
			}
	        
	        if(ingreso!=null){
				if(ingreso.equals("true_")){
					%><div id="ingreso" class='exito mensajes' style="width: 100%;margin-left: 20%;">Los datos Trimestrales se cargaron con Exito!</div><%
				}else{
					%><div id="ingreso" class='error mensajes' style="width: 100%;margin-left: 20%;">Los datos Trimestrales no se pudieron cargar correctamente!</div><%
				}
				session.setAttribute("ingresoExitoso", null);
			}
			%>
			
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