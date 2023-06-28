
package com.emergentes.dao;

import com.emergentes.modelo.Cuentas;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CuentasDAOimpl extends ConexionDB implements CuentasDAO {

   
    @Override
    public void insert(Cuentas cuentas) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("insert into reg_cuentas (SALDO,COD_CLIENTE) values (?,?)");
            ps.setInt(1, cuentas.getSaldo());
            ps.setInt(2, cuentas.getCod_cliente());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

  
    @Override
    public Cuentas getById(int id) throws Exception {
        Cuentas cts = new Cuentas();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("select * from cuentas where ID_REGISTRO=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cts.setId_registro(rs.getInt("id_registro"));
                cts.setSaldo(rs.getInt("saldo"));
                cts.setFecha(rs.getDate("fecha"));
                cts.setCod_cliente(rs.getInt("cod_cliente"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cts;
    }

   
    @Override
    public List<Cuentas> getAll(int id) throws Exception {
        List<Cuentas> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM reg_cuentas WHERE COD_CLIENTE=? ORDER BY ID_REGISTRO DESC";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Cuentas>();
            while (rs.next()) {
                Cuentas cts = new Cuentas();
                cts.setId_registro(rs.getInt("id_registro"));
                cts.setSaldo(rs.getInt("saldo"));
                cts.setFecha(rs.getDate("fecha"));
                cts.setCod_cliente(rs.getInt("cod_cliente"));
                lista.add(cts);
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
