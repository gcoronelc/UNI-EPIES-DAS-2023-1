
package trianguloslin.service;

import trianguloslin.dto.TrianguloDto;


public class TrianguloService {
    
    public TrianguloDto procesarTriangulo(TrianguloDto dto){
        // variables
        String tipo;
        int perimetro;
        double area;
        // proceso
        tipo = obtenerTipo(dto.getLadoA(),dto.getLadoB(),dto.getLadoC());
        perimetro = dto.getLadoA()+dto.getLadoB()+dto.getLadoC();
        area = hallarArea(dto.getLadoA(),dto.getLadoB(),dto.getLadoC());
        // reporte
        dto.setTipo(tipo);
        dto.setPerimetro(perimetro);
        dto.setArea(area);
        return dto;
    }

    private String obtenerTipo(int ladoA, int ladoB, int ladoC) {
        String tipo = "";
        if(ladoA==ladoB && ladoB==ladoC)tipo = "equilatero";
        else if(ladoA!=ladoB && ladoB!=ladoC) tipo = "escaleno";
        else tipo = "isoceles";
        
        return tipo;
    }

    private double hallarArea(int ladoA, int ladoB, int ladoC) {
        double area;
        double p = (ladoA+ladoB+ladoC)/2;
        area = Math.sqrt((p*(p-ladoA)*(p-ladoB)*(p-ladoC)));
        return area;
    }
}
