
package com.emergentes.dao;
import com.emergentes.modelo.Clientes;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
public class ClientesDAOimpl extends ConexionDB implements ClientesDAO{
    
    @Override
    public void insert(Clientes clientes) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("insert into clientes (NOMBRES,APELLIDOS,CEDULA_IDENTIDAD,SEXO,DIRECCION,CELULAR,CORREO) values (?,?,?,?,?,?,?)");
            ps.setString(1, clientes.getNombres());
            ps.setString(2, clientes.getApellidos());
            ps.setString(3, clientes.getCedula_identidad());
            ps.setString(4, clientes.getSexo());
            ps.setString(5, clientes.getDireccion());
            ps.setString(6, clientes.getCelular());
            ps.setString(7, clientes.getCorreo());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
   
    @Override
    public void update(Clientes clientes) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps =this.conn.prepareStatement("update clientes set NOMBRES=?,APELLIDOS=?,CEDULA_IDENTIDAD=?, SEXO=?,DIRECCION=?,CELULAR=?,CORREO=? where ID_CLIENTE=?");
            ps.setString(1, clientes.getNombres());
            ps.setString(2, clientes.getApellidos());
            ps.setString(3, clientes.getCedula_identidad());
            ps.setString(4, clientes.getSexo());
            ps.setString(5, clientes.getDireccion());
            ps.setString(6, clientes.getCelular());
            ps.setString(7, clientes.getCorreo());
            ps.setInt(8, clientes.getId_cliente());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
    
    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("delete from clientes where ID_CLIENTE=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }
   
    @Override
    public Clientes getById(int id) throws Exception {
        Clientes cli = new Clientes();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM clientes WHERE ID_CLIENTE=?");
            ps.setInt(1, id);
            ResultSet rs =ps.executeQuery();
            if (rs.next()) {
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setNombres(rs.getString("nombres"));
                cli.setApellidos(rs.getString("apellidos"));
                cli.setCedula_identidad(rs.getString("cedula_identidad"));
                cli.setSexo(rs.getString("sexo"));
                cli.setCelular(rs.getString("celular"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setCorreo(rs.getString("correo"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;
        
    }
    
    @Override
    public List<Clientes> getAll(int id) throws Exception {
        List<Clientes> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("select * from clientes where ID_CLIENTE=?");
            ps.setInt(1, id);
            ResultSet rs =ps.executeQuery();
            lista = new ArrayList<Clientes>();
            while (rs.next()) {
                Clientes cli = new Clientes();
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setNombres(rs.getString("nombres"));
                cli.setApellidos(rs.getString("apellidos"));
                cli.setCedula_identidad(rs.getString("cedula_identidad"));
                cli.setSexo(rs.getString("sexo"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setCelular(rs.getString("celular"));
                cli.setCorreo(rs.getString("correo"));
                lista.add(cli);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    
    
}
