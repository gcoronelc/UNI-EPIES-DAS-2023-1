package pe.edu.uni.promedioapp.dto;

public class AlumnoDto {

    // Variables
    private String nombre;
    private int promPracticas;
    private int exaParcial;
    private int exaFinal;
    private int promFinal;
    private String condicion;

    // Constructor por defecto
    public AlumnoDto() {
    }

    // Constructor con parametros
    public AlumnoDto(String nombre, int promPracticas, int exaParcial, int exaFinal) {
        this.nombre = nombre;
        this.promPracticas = promPracticas;
        this.exaParcial = exaParcial;
        this.exaFinal = exaFinal;
    }

    // Los metodos getters y setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPromPracticas() {
        return promPracticas;
    }

    public void setPromPracticas(int promPracticas) {
        this.promPracticas = promPracticas;
    }

    public int getExaParcial() {
        return exaParcial;
    }

    public void setExaParcial(int exaParcial) {
        this.exaParcial = exaParcial;
    }

    public int getExaFinal() {
        return exaFinal;
    }

    public void setExaFinal(int exaFinal) {
        this.exaFinal = exaFinal;
    }

    public int getPromFinal() {
        return promFinal;
    }

    public void setPromFinal(int promFinal) {
        this.promFinal = promFinal;
    }

    public String getCondicion() {
        return condicion;
    }

    public void setCondicion(String condicion) {
        this.condicion = condicion;
    }

}
