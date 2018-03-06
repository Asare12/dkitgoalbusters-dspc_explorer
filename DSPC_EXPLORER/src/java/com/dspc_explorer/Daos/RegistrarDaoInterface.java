/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Registrar;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author abdul
 */
public interface RegistrarDaoInterface {
    
    public boolean createRegistrar(Registrar registrar);

    public boolean deleteRegistrar(int regId);

    public boolean updateRegistrar(Registrar registrar);

    public List<Registrar> getAllRegistar();
    
}
