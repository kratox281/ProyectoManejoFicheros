package lecturaEscrituraXLSX;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class LecturaYEscritura {
	// Variables necesarias tanto como para leer como escribir el fichero por medio
	// de la libreria Apache POI
	private File archivo;
	private FileInputStream fis;
	private XSSFWorkbook libro;
	private XSSFSheet hoja;

	public LecturaYEscritura() {
		try {
			archivo = new File(System.getProperty("user.dir") + "/Archivos/datos.gob.es/Defunciones.xlsx");
			System.out.println(archivo.getAbsolutePath().toString());
			fis = new FileInputStream(archivo);
			libro = new XSSFWorkbook(fis);
			hoja = libro.getSheetAt(0);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	//Metodo al que llama el jsp para realizar la lectura del fichero
	public Map<Integer, Object[]> lectura() {
		
		//Mapa para almacenar los datos
		Map<Integer, Object[]> datos = new HashMap<>();
		Iterator<Row> filas = hoja.iterator();

		// Iteramos para obtener los datos dato de cada fila
		int contadorFilas = 0;

		while (filas.hasNext()) {

			contadorFilas++;
			Object[] valores = new Object[10];
			Row fila = filas.next();

			Iterator<Cell> celdas = fila.iterator();
			int contadorCeldas = 0;
			// Obtenemos los datos de cada columna
			while (celdas.hasNext()) {

				contadorCeldas++;

				Cell celda = celdas.next();

				switch (celda.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					// Añadir los datos al mapa para despues imprimirlo en el jsp
					valores[contadorCeldas] = celda.getStringCellValue();
					// Comprobacion
					//System.out.print(celda.getStringCellValue() + "\t");
					break;
				case Cell.CELL_TYPE_NUMERIC:

					valores[contadorCeldas] = celda.getNumericCellValue();
					// Comprobacion
					//System.out.println(celda.getNumericCellValue() + "\t");
					break;
				case Cell.CELL_TYPE_BOOLEAN:

					valores[contadorCeldas] = celda.getBooleanCellValue();
					// Comprobacion
					//System.out.println(celda.getBooleanCellValue() + "\t");
					break;
				}
			}
			//Insertamos en el mapa
			datos.put(contadorFilas, valores);
		}
		
		for (Integer row : datos.keySet()) {
			Object[] lineas = datos.get(row);
			for (Object object : lineas) {
				System.out.println(object);
			}
		}
		return datos;
	}

	public void escritura(ArrayList<String> datos) {
		try {
		 int numeroFilas = hoja.getLastRowNum();
		 //Creamos una fila nueva
		 Row fila = hoja.createRow(numeroFilas++);
		 int numeroCelda  = 0;
		 for(String dato:datos) {
			 //Creamos una celda para cada dato
			 Cell celda = fila.createCell(numeroCelda++);
			 celda.setCellValue((String)dato);
		 }
		 //Escribimos en el archivo los cambioss
		 FileOutputStream fos = new FileOutputStream(archivo);
         libro.write(fos);
         //Comprobacion
         //System.out.println("Escrito con exito");
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
}
