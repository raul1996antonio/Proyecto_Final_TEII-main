
package com.emergentes.utiles;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class ValidateLogin extends ConexionDB{
    Connection con = this.conectar();
    PreparedStatement pr;
    
    public boolean checkUser(String usuario,String contraseña){
        boolean resultado = false;
        try {
            String sql ="select * from usuarios where USUARIO=? and CONTRASEÑA=sha1(?)";
            pr=con.prepareStatement(sql);
            pr.setString(1, usuario);
            pr.setString(2, contraseña);
            ResultSet rs = pr.executeQuery();
            resultado = rs.next();
            
        } catch (SQLException ex) {
            System.out.println("Error al Autentificar "+ex.getMessage());;
        }
        return resultado;
    }
   
    public int Id(String us,String pass){
        int id=0;
        try {
            pr = con.prepareStatement("SELECT ID_CLIENTE FROM clientes c,usuarios u WHERE c.ID_CLIENTE=u.COD_CLIENTE AND USUARIO=? AND CONTRASEÑA=sha1(?)");
            pr.setString(1,us);
            pr.setString(2, pass);
            ResultSet rs =pr.executeQuery();
            while (rs.next()){
                id=rs.getInt("id_cliente");
            }
            
        } catch (SQLException ex) {
            System.out.println("Error al Autentificar "+ex.getMessage());;
        }
        return id;
    }
    public int Saldo(int id){
        int saldo=0;
        try {
            pr = con.prepareStatement("SELECT SALDO FROM reg_cuentas WHERE COD_CLIENTE=? ORDER BY SALDO DESC LIMIT 1");
            pr.setInt(1,id);
            ResultSet rs =pr.executeQuery();
            while (rs.next()){
                saldo=rs.getInt("saldo");
            }
            
        } catch (SQLException ex) {
            System.out.println("Error al Autentificar "+ex.getMessage());;
        }
        return saldo;
    }
    
}
