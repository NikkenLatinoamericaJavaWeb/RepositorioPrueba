package com.nikken.asignacion.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.nikken.asignacion.persistencia.Conexion;


public class Utilitario extends Conexion {
	
	public static char verificacion(String cadena){
		int pos =cadena.length();
		char utimaLetra = cadena.charAt(pos-1);
		return utimaLetra;
		
	}
	
	/**
	 * FunciÛn que elimina acentos y caracteres especiales de
	 * una cadena de texto.
	 * @param input
	 * @return cadena de texto limpia de acentos y caracteres especiales.
	 */
	public static String limpiarCadena(String input) {
	    // Cadena de caracteres original a sustituir.
	    String original = "·‡‰ÈËÎÌÏÔÛÚˆ˙˘uÒ¡¿ƒ…»ÀÕÃœ”“÷⁄Ÿ‹—Á«";
	    // Cadena de caracteres ASCII que reemplazar·n los originales.
	    String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
	    String output = input;
	    for (int i=0; i<original.length(); i++) {
	        // Reemplazamos los caracteres especiales.
	        output = output.replace(original.charAt(i), ascii.charAt(i));
	    }//for i
	    return output;
	}//remove1
	
	public static void xls(File inputFile, File outputFile) 
	{
	        // For storing data into CSV files
	        StringBuffer data = new StringBuffer();
	        try 
	        {
	        FileOutputStream fos = new FileOutputStream(outputFile);

	        // Get the workbook object for XLS file
	        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(inputFile));
	        // Get first sheet from the workbook
	        HSSFSheet sheet = workbook.getSheetAt(0);
	        Cell cell;
	        Row row;

	        // Iterate through each rows from first sheet
	        Iterator<Row> rowIterator = sheet.iterator();
	        while (rowIterator.hasNext()) 
	        {
	                row = rowIterator.next();
	                // For each row, iterate through each columns
	                Iterator<Cell> cellIterator = row.cellIterator();
	                while (cellIterator.hasNext()) 
	                {
	                        cell = cellIterator.next();
	                        
	                        switch (cell.getCellType()) 
	                        {
	                        case Cell.CELL_TYPE_BOOLEAN:
	                                data.append(cell.getBooleanCellValue() + ",");
	                                break;
	                                
	                        case Cell.CELL_TYPE_NUMERIC:
	                                data.append(cell.getNumericCellValue() + ",");
	                                break;
	                                
	                        case Cell.CELL_TYPE_STRING:
	                                data.append(cell.getStringCellValue() + ",");
	                                break;

	                        case Cell.CELL_TYPE_BLANK:
	                                data.append("N" + ",");
	                                break;
	                        
	                        default:
	                                data.append(cell + ",");
	                        }
	                        
	                        data.append('\n'); 
	                }
	        }

	        fos.write(data.toString().getBytes());
	        fos.close();
	        }
	        catch (FileNotFoundException e) 
	        {
	                e.printStackTrace();
	        }
	        catch (IOException e) 
	        {
	                e.printStackTrace();
	        }
	       }
	
	public static void xlsx(File inputFile, File outputFile) {
        // For storing data into CSV files
        StringBuffer data = new StringBuffer();

        try {
            FileOutputStream fos = new FileOutputStream(outputFile);
            // Get the workbook object for XLSX file
            XSSFWorkbook wBook = new XSSFWorkbook(new FileInputStream(inputFile));
            // Get first sheet from the workbook
            XSSFSheet sheet = wBook.getSheetAt(0);
            XSSFRow row;
            // Iterate through each rows from first sheet
            Iterator<Row> rowIterator = sheet.iterator();
            int i=0;
            while (rowIterator.hasNext()) {
                row = (XSSFRow) rowIterator.next();
               
                XSSFCell cell = row.getCell(0);
                XSSFCell cell1 = row.getCell(1);
                XSSFCell cell2 = row.getCell(2);
                XSSFCell cell3 = row.getCell(3);
                XSSFCell cell4 = row.getCell(4);
                XSSFCell cell5 = row.getCell(5);
                XSSFCell cell6 = row.getCell(6);
                XSSFCell cell7 = row.getCell(7);
                
                
		    	
               
                
                if(i>0){
                	String codigo="";
                	String nombre="";
                	String vgp="";
                	String tel="";
                	
                	String stringCellValue = cell.toString();
                	double val = Double.parseDouble(stringCellValue);
            		DecimalFormat  _num= new DecimalFormat("#####");
            		codigo=""+_num.format(val);
            		
                	
                	String stringCellValue3 = cell1.toString();
                	nombre=stringCellValue3.replace(",", "");
                	
                	
            		String stringCellValue1 = cell7.toString();
                	double val1 = Double.parseDouble(stringCellValue1);
            		DecimalFormat  _num1= new DecimalFormat("#####");
            		vgp=""+_num1.format(val1);
            		
            		String stringCellValue2 = cell6.toString();
            		if(stringCellValue2.contains("-") || stringCellValue2.contains("(") ||  stringCellValue2.contains(")") || stringCellValue2.contains(" ")){
            			tel=stringCellValue2;
            		}else{
            			double val2 = Double.parseDouble(stringCellValue2);
            			DecimalFormat  _num2= new DecimalFormat("#####");
            			tel=""+_num2.format(val2);
            		}
                	
                	
			    	data.append(codigo+",");
			    	data.append(nombre+",");
			    	data.append(cell2+",");
			    	data.append(cell3+",");
			    	data.append(cell4+",");
			    	data.append(cell5+",");
			    	data.append(tel+",");
			    	data.append(vgp+",");
			    	
                }else{
                	data.append(cell+",");
     		    	data.append(cell1+",");
     		    	data.append(cell2+",");
     		    	data.append(cell3+",");
     		    	data.append(cell4+",");
     		    	data.append(cell5+",");
     		    	data.append(cell6+",");
     		    	data.append(cell7+"");
                }
		    	
		    	data.append('\n'); 
		    	i++;
            }
            
            
            fos.write(data.toString().getBytes());
            fos.close();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
   
	
	public static  String asigvalue (XSSFCell val){
        String valas="";
     	if (val != null)
          {
     		valas = val.toString();
          }else{                	
     		valas =" ";
          }
     	if(valas.equals("")){
    		valas =" ";
    	}
     	return valas ;	
    }
	
	public static  String asigvalueInt (XSSFCell val){
        String valas="";
     	if (val != null)
          {
     		valas = val.toString();
          }else{                	
     		valas ="0";
          }
     	if(valas.equals("")){
    		valas ="0";
    	}
     	return valas ;	
    }

	
	public ResultSet ObtenerSlider (){
		String cadena="Select * from intranet"; 
		return Consultar(cadena,Constantes.db_intranetlat,Constantes.host);
	}
	
	public static String DateReturn (String strFecha){
		String [] val=strFecha.split(" ");
		return val[0];
	}
	
	public static String format$(String value){
		String result="";
		try{
		String prefix="";
		
		double val = Double.parseDouble(value);
		DecimalFormat  _num= new DecimalFormat("##,###");
		result=prefix+_num.format(val);
		
		System.out.println(value+"-....-"+val+"-....-"+result);
		
		if(result.equals(prefix+".00")){
			result=prefix+"0.00";
		}
		
		}catch(Exception ex){
			System.out.println("error format "+ex.toString());
		}
		return result.replace(".00", "");
	}
	
	public static String format4(String value){
		return value.substring(0,value.length()-4);
	}
	
	public static long difDiasEntre2fechas(int Y1,int M1,int D1,int Y2,int M2,int D2){
		java.util.GregorianCalendar date=new java.util.GregorianCalendar(Y1,M1,D1);
		java.util.GregorianCalendar date2=new java.util.GregorianCalendar(Y2,M2,D2);
		long difms=date2.getTimeInMillis() - date.getTimeInMillis();
		long difd=difms / (1000 * 60 * 60 * 24);
		return difd;
	}
	
	public static ArrayList<String> eliminarRepetidos(ArrayList<String> lista) {
		HashSet<String> hs = new HashSet<String>();
		hs.addAll(lista);
		lista.clear();
		lista.addAll(hs);
		return lista;
	}
	


    /**
     * Retorna el digito numerico en la posicion indicada de derecha a izquierda
     * 
     * @param origin
     *            Cadena en la cual se busca el digito
     * @param position
     *            Posicion de derecha a izquierda a retornar
     * @return Digito ubicado en la posicion indicada
     */
    private static int getDigitAt(String origin, int position) {
        if (origin.length() > position && position >= 0)
            return origin.charAt(origin.length() - position - 1) - 48;
        return 0;
    }

}
