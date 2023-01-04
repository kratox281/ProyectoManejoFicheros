package mainPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
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

    //LEEMOS QUE FORMATO QUIERE EL USUARIO Y LE REEDIRIGIMOS, EL ATRIBUTO SE LLAMA "DATOS"
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String formato;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		EstadisticaAnual estadistica = CargarDatos(request, response);
		String opcion = request.getParameter("opcion");
		boolean redireccionar = false;
		
		//AJUSTAR EL JSP PARA HACER BIEN LAS REDIRECCIONES CON LOS MENSAJES DE ERROR
		if(opcion == null) {
			request.setAttribute("opcion", "null");
		}else {
			request.removeAttribute("opcion");
			request.setAttribute("opcion", opcion);
			if(opcion.equalsIgnoreCase("lectura")) {
				redireccionar = true;
			} else if(opcion.equalsIgnoreCase("escritura")){
				request.setAttribute("datos", "null");
				if(estadistica != null) {
					request.removeAttribute("datos");
					request.setAttribute("datos", estadistica);
					redireccionar = true;
					request.setAttribute("datosLista", DatosLista(request, response));
				}
			}
		}
		
		if(request.getParameter("formato")!=null && redireccionar) {
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
	EstadisticaAnual CargarDatos(HttpServletRequest request, HttpServletResponse response) {
		List<Integer> datos = new ArrayList<>();
		for (String string : request.getParameterValues("dato")) {
			if(string != null && string != "" && isNumeric(string)) {
				datos.add(Integer.parseInt(string));
			} else {
				return null;
			}
		}
		EstadisticaAnual estadistica = new EstadisticaAnual(datos.get(0), datos.get(1), datos.get(2));
		return estadistica;
	}
	
	public List<String> DatosLista(HttpServletRequest request, HttpServletResponse response) {
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
