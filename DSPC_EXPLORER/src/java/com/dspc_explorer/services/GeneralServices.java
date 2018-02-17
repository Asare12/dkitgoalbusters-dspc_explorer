/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.services;

import java.util.ArrayList;

/**
 *
 * @author Abdul
 */
public class GeneralServices {
    public void printArrayList(ArrayList arrayList)
    {
        for(int i=0;i<arrayList.size();i++)
        {
            System.out.println(arrayList.get(i));
        }
    }
    
}
