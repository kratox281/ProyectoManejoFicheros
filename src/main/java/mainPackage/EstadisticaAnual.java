package mainPackage;

public class EstadisticaAnual {
	String anio;
	String hombres;
	String mujeres;
	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getHombres() {
		return hombres;
	}
	public void setHombres(String hombres) {
		this.hombres = hombres;
	}
	public String getMujeres() {
		return mujeres;
	}
	public void setMujeres(String mujeres) {
		this.mujeres = mujeres;
	}
	public EstadisticaAnual(String anio, String hombres, String mujeres) {
		super();
		this.anio = anio;
		this.hombres = hombres;
		this.mujeres = mujeres;
	}
	
}
