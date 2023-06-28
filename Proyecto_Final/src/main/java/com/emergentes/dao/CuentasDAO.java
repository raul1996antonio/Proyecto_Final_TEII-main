
package com.emergentes.dao;
import com.emergentes.modelo.Cuentas;
import java.util.List;
public interface CuentasDAO {
    public void insert(Cuentas cuentas) throws Exception;
    public Cuentas getById(int id) throws Exception;
    public List<Cuentas> getAll(int id) throws Exception; 
}
