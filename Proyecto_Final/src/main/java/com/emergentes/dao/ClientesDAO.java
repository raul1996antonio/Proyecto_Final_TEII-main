
package com.emergentes.dao;
import com.emergentes.modelo.Clientes;
import java.util.List;
public interface ClientesDAO {
    public void insert(Clientes clientes) throws Exception;
    public void update(Clientes clientes) throws Exception;
    public void delete(int id) throws Exception;
    public Clientes getById(int id) throws Exception;
    public List<Clientes> getAll(int id) throws Exception; 
}
