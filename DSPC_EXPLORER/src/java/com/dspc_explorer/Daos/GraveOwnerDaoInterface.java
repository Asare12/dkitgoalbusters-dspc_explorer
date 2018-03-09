/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import java.util.List;

/**
 *
 * @author abdul
 */
public interface GraveOwnerDaoInterface {

    public boolean createGraveOwner(Graveowner graveowner);

    public boolean deleteGraveOwner(int graveId);

    public boolean updateGraveOwner(Graveowner graveowner);

    public List<Graveowner> getAllgraveOwners();

    public Graveowner getGraveOnwerById(int id);

}
