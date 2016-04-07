function soloNumeros(evt)
{
    evt = (evt) ? evt : event;
     
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
     
    var respuesta = true;
     
    if (charCode > 31 && (charCode < 48 || charCode > 57)) 
    {
        respuesta = false;
    }
    return respuesta;
    
}

function quitarformato(val){
	if(val=="$0" || val=="0" || val==""){
		return 0;
	}
	var n=val.replace("$","");
	var s=n.replace(",","");
	var m=s.replace(",","");
	return m;
}



function showHideFilters(){
$(document).ready(function(){
  $('#element1').click(function(){
    $('#element3').toggle();
    $('#element2').toggle();
  }); 
});
}


function formatNumber(num,prefix)  
{  
num = Math.round(parseFloat(num)*Math.pow(10,2))/Math.pow(10,2); 
prefix = prefix || '';  
num += '';  
var splitStr = num.split('.');  
var splitLeft = splitStr[0];  
var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : '.00';  
splitRight = splitRight + '00';  
splitRight = splitRight.substr(0,3);  
var regx = /(\d+)(\d{3})/;  
while (regx.test(splitLeft)) {  
splitLeft = splitLeft.replace(regx, '$1' + ',' + '$2');  
}  
return prefix + splitLeft + splitRight;  
}  



function quitarNumero(str){
	var newStr = str.substring(0, str.length-1);
	return newStr;
}




function submitForm(idVal){
	var pais=idVal.id;
	document.getElementById("hiddenSubmitValue").value=pais;
	document.getElementById("btnSubm").click();
}

function validateFacturas(th){
var val=th.id;
document.getElementById("code_txt_hidden").value=val;
document.getElementById("fact_id").click();
}

function validarDetalleFacturas(th){
	var val=th.id;
	document.getElementById("hiddenCode").value=val;
	document.getElementById("valfact").click();
}


function calcIva(pais,valor){
	var result=0;
if(pais=="Colombia"){
	result=valor*1.16;
}else if(pais=="Mexico"){
	result=valor*1.16;
}else if(pais=="Panama"){
	result=valor*1.7;
}else if(pais=="Guatemala"){
	result=valor*1.12;
}else if(pais=="Costa Rica"){
	result=valor*1.13;
}else if(pais=="El Salvador"){
	result=valor*1.13;
}else if(pais=="Ecuador"){
	result=valor*1.12;
}else if(pais=="Peru"){
	result=valor*1.18;
}
return result;
}



function validateSearch(){
	var x=document.getElementById("id_ci_txt").value;
	if(x==""){
		document.getElementById("info_id_empty").style.display="block";
	}else{
		document.getElementById("id_btn_smbtn").click();
	}
}


function validateSearchBCI(){
		
	document.getElementById("mayDiferenceDate").style.display="none";
	document.getElementById("emptyDiferenceDate").style.display="none";
	var dayIn=document.getElementById("element_1_1").value;
	var monthIn=document.getElementById("element_1_2").value;
	var yearIn=document.getElementById("element_1_3").value;
	
	var dayf=document.getElementById("element_2_1").value;
	var monthf=document.getElementById("element_2_2").value;
	var yearf=document.getElementById("element_2_3").value;
	
	if(dayIn.length==1){
		var diaInicio=dayIn;
		dayIn="0"+diaInicio;
	}
	
	if(dayf.length==1){
		var diafin=dayf;
		dayf="0"+diafin;
	}
	
	var fechaInicio = yearIn+"/"+monthIn+"/"+dayIn;
	var fechafin = yearf+"/"+monthf+"/"+dayf;
	if(dayIn=="" || dayf==""){
		document.getElementById("emptyDiferenceDate").style.display="block";
		document.getElementById("mayDiferenceDate").style.display="none";
	}else{
		var diff = restar(dayIn,monthIn,yearIn,dayf,monthf,yearf);
		if (Date.parse(fechaInicio) > Date.parse(fechafin)) {
		document.getElementById("mayDiferenceDate").style.display="block";
		document.getElementById("emptyDiferenceDate").style.display="none";
		}else{
			if(diff>190){
				document.getElementById("mayDiferenceDate").style.display="none";
				document.getElementById("emptyDiferenceDate").style.display="none";
			}else{
				document.getElementById("id_btn_smbtn_Ci").click();
			}
		}
	}
	
}



function validateSendName(element){
	document.getElementById("idtext").style.display="block";
	var valueElement=document.getElementById("id_pais_txt").value;
	var nm=element.value;
	$("#idtext").load("BonoNameSelect", {pais:valueElement,name:nm});
	var cbx=document.getElementById("idtext").value;
	
	if(cbx=="SinValor"){
		document.getElementById("idtext").style.display="none";
	}else{
		document.getElementById("btn_search").style.display="none";
	}
}

function sendvalidateName(th){
	var x=th.value;
	var j=x.split("_");
	if(j[0]=="SinValor"){
		th.style.display="none";
		document.getElementById("id_ci_txt").value="";
		document.getElementById("id_nm_txt").value="";
		document.getElementById("btn_search").style.display="block";
	}else{
	document.getElementById("id_ci_txt").value=j[0];
	document.getElementById("id_nm_txt").value=j[1];
	th.style.display="none";
	document.getElementById("btn_search").style.display="block";
	}
}

function sendvalidateCI(){
	document.getElementById("btn_search").style.display="block";
	document.getElementById("idtext").style.display="none";
}


function getNombreCi(elemento){
	var codigo = elemento.value;
	$("#textNombre").load("getnombre_by_cardcode", {numeroCi_Form:codigo});
}


function traerEstados(th){
	var paisvalue = th.value;
	$("#estado_id").load("PaisEstado", {pais:paisvalue});
}

function validarconoceCi(eelement){
	var id=eelement.value;
	if(id=="NO"){
		$(".textCi").attr("disabled","disabled");
	}else{
		$(".textCi").removeAttr("disabled");
	}
}

function validarDatos(){
	var nombre=document.getElementById("nombre_idForm").value;
	var pais= document.getElementById("pais_id").value;
	var mail= document.getElementById("mail_idForm").value;
	var tel= document.getElementById("tel_idfrom").value;
	var ci = document.getElementById("id_codigoci").value;
	var id = document.getElementById("know_id").value;
	
	
	var validar=false;
	
	if(nombre==""){
		validar=false;
		document.getElementById("error_formulario").style.display="block";
		document.getElementById("error_formulario").innerHTML="El Campo nombre se encuentra Vacio";
		return;
	}else{validar=true;}
	
	if(pais=="0"){
		validar=false;
		document.getElementById("error_formulario").style.display="block";
		document.getElementById("error_formulario").innerHTML="Por Favor Seleccione un País";
		return;
	}else{validar=true;}
	
	if(mail==""){
		validar=false;
		document.getElementById("error_formulario").style.display="block";
		document.getElementById("error_formulario").innerHTML="El Campo Correo Electronico se encuentra Vacio";
		return;
	}else{validar=true;}
	
	if(tel==""){
		validar=false;
		document.getElementById("error_formulario").style.display="block";
		document.getElementById("error_formulario").innerHTML="El Campo Telefono se encuentra Vacio";
		return;
	}else{validar=true;}
	
	
	
	if(id=="SI"){
		
		if(ci==""){
			validar=false;
			document.getElementById("error_formulario").style.display="block";
			document.getElementById("error_formulario").innerHTML="El Campo Número del CI se encuentra Vacio";
			return;
		}else{validar=true;}
		var x = document.getElementById("hidden_Nombre").value;
		 if(x=="No existe el CI"){
			validar=false;
			document.getElementById("error_formulario").style.display="block";
			document.getElementById("error_formulario").innerHTML="No Se Encontro el CI en nuestra Base de Datos. ";
			return;
		 }else{validar=true;}
	
	}else{validar=true;}
	
	if(validar==true){
		document.getElementById("error_formulario").style.display="none";
		document.getElementById("info_formulario").style.display="block";
		document.getElementById("info_formulario").innerHTML="Procesando Informacion por favor Espere ... ";
		document.getElementById("buffer").style.display="block";
		document.getElementById("enviar_info").click();
	}
}

function borrarInformacion(){
	document.getElementById("nombre_idForm").value="";
	document.getElementById("pais_id").value="0";
	document.getElementById("estado_id").value="0";
	document.getElementById("mail_idForm").value="";
	document.getElementById("tel_idfrom").value="";
	document.getElementById("numci_idform").value="";
	document.getElementById("nombreid_from").value="";
}

function restar(dia1,mes1,ano1,dia2,mes2,ano2)
{
 fecha1=new Date(ano1,mes1-1,dia1);
 fecha2=new Date(ano2,mes2-1,dia2);
 var resta=(fecha2-fecha1)/1000/3600/24; 
 return resta;
}


function validateSearchDate(){
	document.getElementById("mayDiferenceDate").style.display="none";
	document.getElementById("emptyDiferenceDate").style.display="none";
	var dayIn=document.getElementById("element_1_1").value;
	var monthIn=document.getElementById("element_1_2").value;
	var yearIn=document.getElementById("element_1_3").value;
	
	var dayf=document.getElementById("element_2_1").value;
	var monthf=document.getElementById("element_2_2").value;
	var yearf=document.getElementById("element_2_3").value;
	
	if(dayIn.length==1){
		var diaInicio=dayIn;
		dayIn="0"+diaInicio;
	}
	
	if(dayf.length==1){
		var diafin=dayf;
		dayf="0"+diafin;
	}
	
	var fechaInicio = yearIn+"/"+monthIn+"/"+dayIn;
	var fechafin = yearf+"/"+monthf+"/"+dayf;
	if(dayIn=="" || dayf==""){
		document.getElementById("emptyDiferenceDate").style.display="block";
		document.getElementById("mayDiferenceDate").style.display="none";
	}else{
		
		if (Date.parse(fechaInicio) > Date.parse(fechafin)) {
		document.getElementById("mayDiferenceDate").style.display="block";
		document.getElementById("emptyDiferenceDate").style.display="none";
		}else{
			
		 document.getElementById("dateSearchDiference").click();
			
		}
	}
	
}


function validateSearchDateBa(){
	document.getElementById("mayDiferenceDate").style.display="none";
	document.getElementById("maxDiferenceDate").style.display="none";
	var dayIn=document.getElementById("element_1_1").value;
	var monthIn=document.getElementById("element_1_2").value;
	var yearIn=document.getElementById("element_1_3").value;
	
	var dayf=document.getElementById("element_2_1").value;
	var monthf=document.getElementById("element_2_2").value;
	var yearf=document.getElementById("element_2_3").value;
	
	if(dayIn.length==1){
		var diaInicio=dayIn;
		dayIn="0"+diaInicio;
	}
	
	if(dayf.length==1){
		var diafin=dayf;
		dayf="0"+diafin;
	}
	
	var fechaInicio = yearIn+"/"+monthIn+"/"+dayIn;
	var fechafin = yearf+"/"+monthf+"/"+dayf;
	if(dayIn=="" || dayf==""){
		document.getElementById("mayDiferenceDate").style.display="none";
		document.getElementById("maxDiferenceDate").style.display="none";
		document.getElementById("dateSearchDiference").click();
	}else{
		var diff = restar(dayIn,monthIn,yearIn,dayf,monthf,yearf);
		if (Date.parse(fechaInicio) > Date.parse(fechafin)) {
		document.getElementById("mayDiferenceDate").style.display="block";
		document.getElementById("maxDiferenceDate").style.display="none";
		}else{
			if(diff>190){
				document.getElementById("mayDiferenceDate").style.display="none";
				document.getElementById("maxDiferenceDate").style.display="block";
			}else{
				document.getElementById("dateSearchDiference").click();
			}
		}
	}
	
}

function  subirArchivo(){
	var text = document.getElementById("file_up").value;
	var val = text.replace("C:\\fakepath\\","");
	
	extensiones_permitidas = new Array(".xls", ".xlsx", ".csv"); 
	extension = (val.substring(val.lastIndexOf("."))).toLowerCase(); 
	permitida = false; 
    
	for (var i = 0; i < extensiones_permitidas.length; i++) { 
       if (extensiones_permitidas[i] == extension) { 
       permitida = true; 
       break; 
       }
    }
	
	if(permitida == false){
		document.getElementById("NoPermitido").style.display="block";
	}else{
		document.getElementById("enviarestim").click();
	}
	
	
}
