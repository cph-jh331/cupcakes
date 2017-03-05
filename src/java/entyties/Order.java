package entyties;

import java.util.ArrayList;
import java.util.List;

public class Order {

    private int oid;
    private int uid;
    private List<OrderLine> orderList;
    private double price;
    private String date;

    public Order(int oid, int uid, double price, String date)
    {
        this.oid = oid;
        this.price = price;
        this.uid = uid;
        this.date = date;
        orderList = new ArrayList<>();
    }

    /**
     * @return the oid
     */
    public int getOid()
    {
        return oid;
    }

    /**
     * @return the uid
     */
    public int getUid()
    {
        return uid;
    }

    /**
     * @return the orderList
     */
    public List<OrderLine> getOrderList()
    {
        return orderList;
    }

    /**
     * @return the price
     */
    public double getPrice()
    {
        return price;
    }

    /**
     * @return the date
     */
    public String getDate()
    {
        return date;
    }

}
