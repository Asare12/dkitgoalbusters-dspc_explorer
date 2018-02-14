/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Section;
import java.util.List;

/**
 *
 * @author abdul
 */
public interface SectionDaoInterface {

    public boolean createSection(Section section);

    public boolean deleteSection(Section section);

    public boolean updateSection(Section section);

    public List<Section> getAllSection();

}
