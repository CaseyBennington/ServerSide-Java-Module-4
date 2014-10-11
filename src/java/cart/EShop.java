package cart;

import java.util.*;

public class EShop {

    public EShop() {
    }

    public static ArrayList getCats() {
        ArrayList values = new ArrayList();

        values.add(new Category("1", "Beer"));
        values.add(new Category("2", "Wine"));
        values.add(new Category("3", "Books about Wine"));
        values.add(new Category("4", "Other"));
        return values;
    }

    public static ArrayList getItems(String catid) {
        ArrayList values = new ArrayList();
        if (catid.equals("1")) {
            values.add(new Product("232", "Brown Ale",
                    "", 999));
            values.add(new Product("238", "Boston Lager",
                    "", 1299));

        } else if (catid.equals("2")) {
            values.add(new Product("872", "Red Zinfindel",
                    "", 2500));
            values.add(new Product("758", "Rose",
                    "", 4500));

        } else if (catid.equals("3")) {
            values.add(new Product("511", "Beginning Wine Making",
                    "", 3999));
            values.add(new Product("188", "Professional Vineyards 5",
                    "", 4999));
            values.add(new Product("148", "Vines and Us Bible",
                    "", 5699));

        } else if (catid.equals("4")) {
            values.add(new Product("765", "The future ain't what it used to be.",
                    "", 3999));
            values.add(new Product("818", "We're lost, but we're making good time.",
                    "", 2599));
            values.add(new Product("168", "When you come to a fork in the road, take it.",
                    "", 1599));
            values.add(new Product("151", "We made too many wrong mistakes.",
                    "", 14999));
            values.add(new Product("111", "Nobody goes there anymore because it's too crowded.",
                    "", 4459));
        }
        return values;
    }

    public static Product getItem(String sku) {
        ArrayList cats = getCats();
        Product foundProd = null;
        for (int i = 0; i < cats.size(); i++) {
            Category curCat = (Category) cats.get(i);
            ArrayList items = getItems(curCat.getId());
            for (int j = 0; j < items.size(); j++) {
                Product curProd = (Product) items.get(j);
                if (curProd.getSku().equals(sku)) {
                    foundProd = curProd;
                    break;
                }
            }
            if (foundProd != null) {
                break;
            }
        }

        return foundProd;
    }

    public static void clearList(List list) {
        list.clear();
    }

    public static void addList(List list, Object item) {
        list.add(item);
    }

    public static void removeFromList(List list, Object item) {
        list.remove(item);
    }

    public static Date getCurrentDate() {
        Date date = new Date();
        return date;
    }
}