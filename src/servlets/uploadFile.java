package servlets;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.itextpdf.awt.AsianFontMapper;
import com.nikken.asignacion.impl.AsignacionImpl;
import com.nikken.asignacion.model.Ganador;
import com.nikken.asignacion.util.Utilitario;

/**
 * Servlet implementation class uploadFile
 */
public class uploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= request.getSession(true); 
		try {
	        //Proceso de la libreria commons.fileupload para obtener el archivo enviado al servidor
	        FileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        List<FileItem> items = upload.parseRequest(request);
	        FileItem item = items.get(0); 
           
	        System.out.println("Nombre del archivo:\t"+item.getName());
            System.out.println("Tamaño del archivo:\t"+item.getSize()/1024+"Kb");
            char a= Utilitario.verificacion(item.getName());
            
            if(a== 'v'){
          	  //Copio el archivo en alguna ruta del servidor:
	            item.write(new File("C:\\report\\subidaGanadores.csv"));
            }
            if(a=='s'){
            	item.write(new File("C:\\report\\subidaGanadores.xls"));
            	session.setAttribute("fileEstimado", "C:\\report\\subidaGanadores.xls");
            	File inputFile = new File("c://report//subidaGanadores.xls");
                File outputFile = new File("c://report//subidaGanadores.csv");
                Utilitario.xls(inputFile, outputFile);
            }
            if(a=='x'){
	          	 item.write(new File("C:\\report\\subidaGanadores.xlsx"));
	          	 session.setAttribute("fileEstimado", "C:\\report\\subidaGanadores.xlsx");
	          	 File inputFile = new File("c://report//subidaGanadores.xlsx");
	             File outputFile = new File("c://report//subidaGanadores.csv");
	             Utilitario.xlsx(inputFile, outputFile);
            }
            
            List<Ganador> listDatos= new ArrayList<Ganador>();
            listDatos= AsignacionImpl.leerGanador();
            boolean eliminacionExitoso = AsignacionImpl.BorrarGanadores();
            boolean ingresoExitoso = AsignacionImpl.InserccionGanadores(listDatos);
            ingresoExitoso =AsignacionImpl.InserccionGanadoresHistorico(listDatos);
            
            session.setAttribute("eliminacionExitoso", eliminacionExitoso+"_");
            session.setAttribute("ingresoExitoso", ingresoExitoso+"_");
            session.setAttribute("ExitoArchivo", "si");
            request.getRequestDispatcher("/subirGanadores.jsp").forward(request, response);
            
		}catch (Exception e) {
			
			session.setAttribute("ExitoArchivo", "no");
            response.sendRedirect("subirGanadores.jsp");
            
	         e.printStackTrace();
	    }
		
	}

}
