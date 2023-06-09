/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.uni.promedioapp.service;

import pe.edu.uni.promedioapp.dto.AlumnoDto;

/**
 *
 * @author LAB-A
 */
public class EscuelaService {
    
    public AlumnoDto procesarNotas(AlumnoDto dto){
        // Variables
        int pf;
        String condicion;
        // Proceso
        pf = (dto.getPromPracticas() + dto.getExaParcial() + dto.getExaFinal()) / 3;
        condicion = (pf>=12)?"APROBADO":"DESAPROBADO";
        // Reporte
        dto.setPromFinal(pf);
        dto.setCondicion(condicion);
        return dto;
    }
}
