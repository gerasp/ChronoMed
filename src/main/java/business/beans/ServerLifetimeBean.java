/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business.beans;

import javax.ejb.Schedule;
import javax.ejb.Singleton;

/**
 *
 * @author alour
 */
@Singleton
public class ServerLifetimeBean {
    public ServerLifetimeBean() {
    }

    private long time = 0;
    
    @Schedule(hour = "*", minute = "*", persistent = false)
    
    public void myTimer() {
        System.out.println(++this.time);
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public long getTime() {
        return time;
    }
}
