package xml;

import java.util.ArrayList;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import mainPackage.EstadisticaAnual;

public class HandlerSAXLector extends DefaultHandler {
	private ArrayList<EstadisticaAnual> anios = new ArrayList<EstadisticaAnual>();
	private EstadisticaAnual estadisticaAnual;
	private StringBuilder buffer = new StringBuilder();
	
	public ArrayList<EstadisticaAnual> getAnios() {
		return anios;
	}

	//Reconoce etiquetas de apertura
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		switch (qName) {
		case "anio_def":
			estadisticaAnual = new EstadisticaAnual();
			anios.add(estadisticaAnual);
			break;
		case "anio":
		case "hombres":
		case "mujeres":
			buffer.delete(0, buffer.length());
			break;
		}
	}

	//Reconoce etiquetas de cierre
	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		switch (qName) {
		case "anio":
			estadisticaAnual.setAnio(Integer.parseInt(buffer.toString()));
			break;
		case "hombres":
			estadisticaAnual.setHombres(Integer.parseInt(buffer.toString()));
			break; 
		case "mujeres":
			estadisticaAnual.setMujeres(Integer.parseInt(buffer.toString()));
			break;
		}
	}

	//Reconoce texto interno de etiquetas
	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		buffer.append(ch, start, length);
		System.out.println(buffer.toString()+" Aqui se llena el buffer");
	}
}
