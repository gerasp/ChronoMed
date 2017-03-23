/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Stateless;

/**
 *
 * @author Adrian
 */
@Stateless
public class NewSessionBean {

    public String estring(){
        return "estring";
    }
}
