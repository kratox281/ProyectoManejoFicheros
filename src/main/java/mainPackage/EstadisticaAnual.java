package mainPackage;

public class EstadisticaAnual {
	int anio;
	int hombres;
	int mujeres;
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public int getHombres() {
		return hombres;
	}
	public void setHombres(int hombres) {
		this.hombres = hombres;
	}
	public int getMujeres() {
		return mujeres;
	}
	public void setMujeres(int mujeres) {
		this.mujeres = mujeres;
	}
	public EstadisticaAnual(int anio, int hombres, int mujeres) {
		super();
		this.anio = anio;
		this.hombres = hombres;
		this.mujeres = mujeres;
	}
	
	//DEVUELVE EL OBJETO COMO UN ARRAY DE STRING
	public String[] getArrayString() {
		String[] string = {String.valueOf(getAnio()),String.valueOf(getHombres()),String.valueOf(getMujeres())};
		return string;
	}
}
