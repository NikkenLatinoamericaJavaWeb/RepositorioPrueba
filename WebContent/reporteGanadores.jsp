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
    <%String name = "", pais= "", area ="";  %>
         	 <%
         		 pais=request.getParameter("pais");
         	     name=request.getParameter("nombre");
         	     area=request.getParameter("area");
         	 %>
         	 
    
    <hr class="hidden"/>
  </div>
  <div id="content" style="width: 100%;margin-top: -1%; margin-left: 0%;">
      <div class="Letra_Intra">
        <div id="contentBlock">
          <div class="item itemOdd">
         	 <span class="date">Nikken Latinoamérica</span>
         	 
         	 <h3>"Reporte  de Asignacion de Prospectos".</h3>
         	 <%try{
			%>
         	 <fieldset style="margin-left: 0%;width:100%;">
         	 <legend>Filtros</legend>
         	 <form action="" method="post">
	         	 <table>
	         	 		<tr>
	    					<td style="background-color: white">
	    						<div style="margin-top: -5%;">
	    							<input type="hidden" name="element_pais" value="<%=pais %>"/>
	    							<input type="hidden" name="area_nombre" value="<%=area %>_<%=name%>"/>
			 						<label class="description" for="element_1" style="font-weight: bold; font-size: 13px;">Desde </label></br>
									<input id="element_1_1" name="element_1_1" class="element text" size="2" maxlength="2" value="" type="text" readonly> /
									<label for="element_1_1">DD</label>
									<span>
										<input id="element_1_2" name="element_1_2" class="element text" size="2" maxlength="2" value="" type="text" readonly> /
										<label for="element_1_2">MM</label>
									</span>
									<span>
				 						<input id="element_1_3" name="element_1_3" class="element text" size="4" maxlength="4" value="" type="text" readonly>
										<label for="element_1_3">YYYY</label>
									</span>
									<span id="calendar_1">
										<img id="cal_img_1" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
									</span>
									<script type="text/javascript">
										Calendar.setup({
										inputField	 : "element_1_3",
										baseField    : "element_1",
										displayArea  : "calendar_1",
										button		 : "cal_img_1",
										ifFormat	 : "%B %e, %Y",
										onSelect	 : selectEuropeDate
										});
									</script>
									</div>
			 					</td>
	    					<td style="background-color: white">
			 					<div>
			 						<label class="description" for="element_2" style="font-weight: bold;font-size: 13px;">Hasta </label></br>
									<span>
										<input id="element_2_1" name="element_2_1" class="element text" size="2" maxlength="2" value="" type="text" readonly> /
										<label for="element_2_1">DD</label>
									</span>
									<span>
										<input id="element_2_2" name="element_2_2" class="element text" size="2" maxlength="2" value="" type="text" readonly> /
										<label for="element_2_2">MM</label>
									</span>
									<span>
								 		<input id="element_2_3" name="element_2_3" class="element text" size="4" maxlength="4" value="" type="text" readonly>
										<label for="element_2_3">YYYY</label>
									</span>
								
									<span id="calendar_2">
										<img id="cal_img_2" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
									</span>
									<script type="text/javascript">
										Calendar.setup({
										inputField	 : "element_2_3",
										baseField    : "element_2",
										displayArea  : "calendar_2",
										button		 : "cal_img_2",
										ifFormat	 : "%B %e, %Y",
										onSelect	 : selectEuropeDate
										});
									</script>
								</div>
								<div style="display:none">
				    				<input id="dateSearchDiference" type="submit" name="submit_f"/>
				    			</div>	
	    					</td>
	    					</tr>
	    					<tr>
	    					<td style="background-color: white">
	         	 				<img src="images/searchBill.png" id="btn_search"  onclick="validateSearchDate()" style="cursor: pointer;width: 17%;margin-bottom: -7%;margin-left: 189%;margin-top: -7%;"/>
	         	 			</td>
	         	 		</tr>
	         	 	</table>
	         	 </form>
	         	</fieldset>
	         	<div id="mayDiferenceDate" class='error mensajes' style="display:none;margin-left:7%;width:50%;">Ups! La fecha de inicio no debe ser mayor a la fecha final</div>
				<div id="emptyDiferenceDate" class='info mensajes' style="display:none;margin-left:7%;width:50%;">Los campos de Fecha se encuentran vacios!</div>
				<div style="width: 133%;margin-top: 8%;margin-left: 4%;">
				<%if(request.getParameter("submit_f")!=null){
					String dayIn=request.getParameter("element_1_1");
					String mesIn=request.getParameter("element_1_2");
					String yearIn=request.getParameter("element_1_3");
					String dayFn=request.getParameter("element_2_1");
					String mesFn=request.getParameter("element_2_2");
					String yearfn=request.getParameter("element_2_3");
					
					if(dayIn.length()==1){
						String diaIn=dayIn;
						dayIn="0"+diaIn;
					}
				
					
				
					if(dayFn.length()==1){
						String diafn=dayFn;
						dayFn="0"+diafn;
					}
				
					String fechaInicio=yearIn+mesIn+dayIn;
					String fechaFin=yearfn+mesFn+dayFn;
					
					ResultSet ds = AsignacionImpl.traerReporteGanadoresAsginados(fechaInicio,fechaFin);
					List<Report> listaExcel= new ArrayList<Report>();					
					
					
					session.setAttribute("Fechas","Mostrando Resultados desde el día "+dayIn+" - "+mesIn+" - "+yearIn+" hasta el día  "+dayFn+" - "+mesFn+" -"+yearfn+"");
					
					%><div id="mayDiferenceDate" class='exito mensajes' style="margin-left: 5%;width: 50%;"> Mostrando Resultados desde el día  "<%=dayIn%> - <%=mesIn%> - <%=yearIn%>" hasta el día  "<%=dayFn%> - <%=mesFn%> - <%=yearfn%>" </div>
					 <a href="reportGanadores"><img src="images/excelicon.png" id="dw_2" style="margin-left:56%" />Descargar  Información</a>
					<%
					
					// Imprimir Datos en un dataTable
					%>
						<div style="  margin-left: -8%;">
						<table id="detalleOtrosConceptos" style="margin-left: 0%">
							<thead>
								<tr>
									<th>Codigo AB</th>
									<th>Nombre AB</th>
									<th>Rango AB</th>
									<th>Pais AB</th>
									<th>Estado AB</th>
									<th>Nombre Prospecto</th>
									<th>Pais Prospecto</th>
									<th>Estado Prospecto</th>
									<th>Fecha Asignacion</th>
									<th>Operador</th>
								</tr>
							</thead>
								<%
								try{
									while(ds.next()){
									 %>
									 <tr>
									 	<td><%=ds.getString("CodigoAB") %></td>
									 	<td><%=ds.getString("Nombre AB") %></td>
									 	<td><%=ds.getString("RangoAB") %></td>
									 	<td><%=ds.getString("PaisAB") %></td>
									 	<td><%=ds.getString("EstadoAB") %></td>
									 	<td><%=ds.getString("Nombre Prospecto") %></td>
									 	<td><%=ds.getString("Pais Prospecto") %></td>
									 	<td><%=ds.getString("Estado Prospecto") %></td>
									 	<td><%=ds.getString("Fechas Asignacion") %></td>
									 	<td><%=ds.getString("operador") %></td>
									 </tr>
									 <%
									 Report d= new Report();
									 d.setCodigoAB(ds.getString("CodigoAB"));
									 d.setNombreAB(ds.getString("Nombre AB"));
									 d.setRangoAB(ds.getString("RangoAB"));
									 d.setPaisAB(ds.getString("PaisAB"));
									 d.setEstadoAB(ds.getString("EstadoAB"));
									 d.setNombreProspecto(ds.getString("Nombre Prospecto"));
									 d.setPaisProspecto(ds.getString("Pais Prospecto"));
									 d.setEstadoProspecto(ds.getString("Estado Prospecto"));
									 d.setFechaAsignacion(ds.getString("Fechas Asignacion"));
									 listaExcel.add(d);
									}
									
									 session.setAttribute("DatosExportar", listaExcel);
								}catch(Exception ex){
									System.out.println(ex.toString());
								}
								%>
						</table>
						</div>
						<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
								<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
								<script type="text/javascript" >
									$("#detalleOtrosConceptos").dataTable({
									"bJQueryUI": true,
										"iDisplayLength": 15,
										"aaSorting": []
								});
								</script>
					<%
					
				} %>
				</div>
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