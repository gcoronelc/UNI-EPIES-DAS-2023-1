package pe.edu.uni.promedioapp.prueba;

import pe.edu.uni.promedioapp.dto.AlumnoDto;
import pe.edu.uni.promedioapp.service.EscuelaService;

public class Prueba01 {
    
    public static void main(String[] args) {
        // Datos
        AlumnoDto dto = new AlumnoDto("Gustavo", 10, 8, 18);
        // Proceso
        EscuelaService service = new EscuelaService();
        dto = service.procesarNotas(dto);
        // Reporte
        System.out.println("PF: " + dto.getPromFinal());
        System.out.println("Condicion: " + dto.getCondicion());
    }
}
