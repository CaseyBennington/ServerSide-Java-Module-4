package cart;

public class LineItem {

    private int quantity;
    private String sku;
    private String desc;
    private double price;
    private double newTotal;

    public LineItem() {
    }

    public LineItem(int quantity, String sku, String desc, double price) {
        this.quantity = quantity;
        this.sku = sku;
        this.desc = desc;
        this.price = price;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSku() {
        return this.sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getDesc() {
        return this.desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getNewTotal() {
        return this.newTotal;
    }

    public void setNewTotal(double newTotal) {
        this.newTotal = newTotal;
    }
}