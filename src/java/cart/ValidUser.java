/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.beans.*;
import java.io.Serializable;

public class ValidUser implements Serializable {

    private int userID;
    private String first;
    private String last;
    private String email;
    private String password;
    private static int userNum = 1000;

    public ValidUser() {
        userID = userNum;
        userNum++;
    }

    public ValidUser(String first, String last, String email, String password) {
        userID = userNum;
        userNum++;
        this.first = first;
        this.last = last;
        this.email = email;
        this.password = password;
    }

    public static void setUserNum(int userNum) {
        ValidUser.userNum = userNum;
    }

    public int getUserID() {
        return this.userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirst() {
        return this.first;
    }

    public void setFirst(String first) {
        this.first = first;
    }

    public String getLast() {
        return this.last;
    }

    public void setLast(String last) {
        this.last = last;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}