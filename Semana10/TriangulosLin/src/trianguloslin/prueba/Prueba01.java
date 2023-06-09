
package trianguloslin.prueba;

import trianguloslin.dto.TrianguloDto;
import trianguloslin.service.TrianguloService;

public class Prueba01 {
    
    public static void main(String[] args) {
        
        // datos
        TrianguloDto dto = new TrianguloDto(3,4 ,5 );
        // procesos
        TrianguloService service = new TrianguloService();
        dto=service.procesarTriangulo(dto);
        // reporte
        System.out.println("tipo " + dto.getTipo());
        System.out.println("perimetro " + dto.getPerimetro());
        System.out.println("area " + dto.getArea());
    }
 
}
