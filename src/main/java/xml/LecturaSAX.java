package xml;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;

import mainPackage.EstadisticaAnual;

public class LecturaSAX {
	
	private ArrayList<EstadisticaAnual> aniodefs;
	
	public LecturaSAX() {
		super();
		try {
			lecturaCompleta();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void lecturaCompleta() throws ParserConfigurationException, SAXException {
		SAXParserFactory saxParserFactory = SAXParserFactory.newInstance();
		SAXParser saxParser = saxParserFactory.newSAXParser();
		
		
		//Definir estructura XML
		File file = new File("C:\\Users\\casmarru\\Pictures\\ProyectoManejoFicheros\\Archivos\\datos.gob.es\\Defunciones.xml");
		HandlerSAXLector handler = new HandlerSAXLector();
		
		//Empieza a leer el documento
		try {
			saxParser.parse(file, handler);
		} catch (SAXException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		aniodefs = handler.getAnios();
	}

	public ArrayList<EstadisticaAnual> getAniodefs() {
		return aniodefs;
	}
}
