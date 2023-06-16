package pe.edu.uni.ventaflores.service;

import java.sql.Connection;
import java.sql.SQLException;
import pe.edu.uni.ventaflores.db.AccesoDB;
import pe.edu.uni.ventaflores.model.Venta;

public class NegocioService {
    
    public Venta procesarVenta(Venta venta){
        // Variables
        Connection cn = null;
        // Proceso
        try {
            // Inicio de TX
            cn = AccesoDB.getConnection();
            cn.setAutoCommit(false); // Inicio de TX
            // 1: 
            
            // 2: 
            
            // Fin de TX
            cn.commit();
        } catch (SQLException e) {
            try {
                cn.rollback(); // Cancela la TX.
            } catch (Exception e1) {
            }
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            try {
                cn.rollback(); // Cancela la TX
            } catch (Exception e1) {
            }
            throw new RuntimeException("Error en el proceso, intentelo nuevamente.");
        } finally{
            try {
                cn.close();
            } catch (Exception e) {
            }
        }
        // Reporte
        return venta;
    }
    
}
