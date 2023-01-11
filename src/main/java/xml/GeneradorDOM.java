package xml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import mainPackage.EstadisticaAnual;

public class GeneradorDOM {
	private Document document;

	public GeneradorDOM() throws ParserConfigurationException {
		DocumentBuilderFactory factoria = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factoria.newDocumentBuilder();
		document = builder.newDocument();
	}
	
	public void generarEtiquetasInicio() {
		Element estadistica = document.createElement("estadistica-defunciones");
		document.appendChild(estadistica);
	}
	
	public void generarDocumentoLeido(ArrayList<EstadisticaAnual> estadisticasAnuales) {
		Node estadistica = document.getFirstChild();
		for (EstadisticaAnual estadisticaAnualLeido : estadisticasAnuales) {
		Element aniodef = document.createElement("anio_def");
		estadistica.appendChild(aniodef);
		
			Element anios = document.createElement("anio");
			anios.appendChild(document.createTextNode(String.valueOf(estadisticaAnualLeido.getAnio())));
			System.out.println(String.valueOf(estadisticaAnualLeido.getAnio())+"anio ");
			aniodef.appendChild(anios);
			Element hombresE = document.createElement("hombres");
			hombresE.appendChild(document.createTextNode(String.valueOf(estadisticaAnualLeido.getHombres())));
			System.out.println(String.valueOf(estadisticaAnualLeido.getHombres())+"hombre");
			aniodef.appendChild(hombresE);
			Element mujeresE = document.createElement("mujeres");
			mujeresE.appendChild(document.createTextNode(String.valueOf(estadisticaAnualLeido.getMujeres())));
			System.out.println(String.valueOf(estadisticaAnualLeido.getMujeres())+"muje");
			aniodef.appendChild(mujeresE);
		}
	}
	
	public void generarDocument(EstadisticaAnual estadisticaAn) {
		Node estadistica = document.getFirstChild();
		Element aniodef = document.createElement("anio_def");
		estadistica.appendChild(aniodef);
		Element anios = document.createElement("anio");
		anios.appendChild(document.createTextNode(String.valueOf(estadisticaAn.getAnio())));
		aniodef.appendChild(anios);
		Element hombres = document.createElement("hombres");
		hombres.appendChild(document.createTextNode(String.valueOf(estadisticaAn.getHombres())));
		aniodef.appendChild(hombres);
		Element mujeres = document.createElement("mujeres");
		mujeres.appendChild(document.createTextNode(String.valueOf(estadisticaAn.getMujeres())));
		aniodef.appendChild(mujeres);
	}
	
	public void generarXML() throws IOException, TransformerException {
		TransformerFactory factoria = TransformerFactory.newInstance();
		Transformer transformer = factoria.newTransformer();
		
		Source source = new DOMSource(document);
		File file = new File(System.getProperty("user.dir") + "/Archivos/datos.gob.es/Defunciones.xml");
		FileWriter fw = new FileWriter(file);
		PrintWriter pw = new PrintWriter(fw);
		Result result = new StreamResult(pw);
		
		transformer.transform(source, result);
	}
}
