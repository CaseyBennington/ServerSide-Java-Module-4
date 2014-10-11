package cart;

import java.util.*;

public class Customers {

    public static ArrayList getAllCustomers() {
        ArrayList customers = new ArrayList();

        customers.add(new ValidUser("Tom", "Thomas", "tthomas@here.com", "abc123"));
        customers.add(new ValidUser("Sue", "Harris", "sharris@here.com", "def456"));
        customers.add(new ValidUser("Ken", "Kenny", "kkenny@here.com", "ghi789"));
        return customers;
    }

    public static void loadCustomer(ValidUser v) {
        ArrayList custs = getAllCustomers();
        custs.add(v);
    }

    public static ValidUser getCust(String email) {
        ArrayList custs = getAllCustomers();
        ValidUser foundUser = null;
        for (int i = 0; i < custs.size(); i++) {
            ValidUser curUser = (ValidUser) custs.get(i);
            if (curUser.getEmail().equalsIgnoreCase(email)) {
                foundUser = curUser;
                break;
            } else {
                break;
            }
        }
        return foundUser;
    }

    public static boolean isCust(String email) {
        ArrayList custs = getAllCustomers();
        boolean foundUser = false;
        for (int i = 0; i < custs.size(); i++) {
            ValidUser curUser = (ValidUser) custs.get(i);
            if (curUser.getEmail().equalsIgnoreCase(email)) {
                foundUser = true;
                break;
            } else {
                break;
            }
        }
        return foundUser;
    }
}