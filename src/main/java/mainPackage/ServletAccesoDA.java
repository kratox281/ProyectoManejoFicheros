package mainPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Servlet implementation class ServletAccesoDA
 */
public class ServletAccesoDA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAccesoDA() {
        super();
        // TODO Auto-generated constructor stub
    }

    //LEEMOS QUE FORMATO QUIERE EL USUARIO Y LE REEDIRIGIMOS EL ATRIBUTO SE LLAMA "DATOS"
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String formato;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		List<String> datos = CargarDatos(request, response);
		String opcion = request.getParameter("opcion");
		if(datos != null) {
			request.removeAttribute("datos");
			request.setAttribute("datos", datos);
		}
		else {
			request.setAttribute("datos", "null");
		}
		
		if(opcion != null) {
			request.removeAttribute("opcion");
			request.setAttribute("opcion", opcion);
		}
		else {
			request.setAttribute("opcion", "null");
		}
		
		if(request.getParameter("formato")!=null && datos != null && opcion != null) {
			formato = request.getParameter("formato");
			switch (formato) {
				case "XLS": {
					request.getRequestDispatcher("/DatosAbiertosXLS.jsp").forward(request, response);
					break;
				}
				case "CSV":{
					request.getRequestDispatcher("/DatosAbiertosCSV.jsp").forward(request, response);
					break;
				}
				case "JSON":{
					request.getRequestDispatcher("/DatosAbiertosJSON.jsp").forward(request, response);
					break;
				}
				case "XML":{
					request.getRequestDispatcher("/DatosAbiertosXML.jsp").forward(request, response);
					break;
				}
			default:
				throw new IllegalArgumentException("Unexpected value: " + formato);
			}
		} else {
			request.getRequestDispatcher("/AccesoDA.jsp").forward(request, response);
		}
	}
	
	//MÉTODO PARA CARGAR LOS DATOS, ES REQUERIBLE A LA HORA DE LUEGO ADMINISTRARLOS TENER EN CUENTA EL ORDEN DE INSERCCIÓN
	//1. AÑO
	//2. HOMBRES
	//3. MUJERES
	List<String> CargarDatos(HttpServletRequest request, HttpServletResponse response) {
		List<String> datos = new ArrayList<>();
		for (String string : request.getParameterValues("dato")) {
			if(string != null && string != "" && isNumeric(string)) {
				datos.add(string);
			} else {
				return null;
			}
		}
		return datos;
	}
	
	//MÉTODO PARA COMPROBAR SI ES UN NÚMERO ENTERO
	public static boolean isNumeric(String str) { 
		  try {
		    Integer.parseInt(str);  
		    return true;
		  } catch(NumberFormatException e){
		    return false;
		  }
	}
}
