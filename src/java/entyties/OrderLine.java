package entyties;

import cake.CupCake;

public class OrderLine {

    private CupCake cupCake;
    private int quantity;
    private double price;

    public OrderLine(CupCake cupCake, int quantity)
    {
        this.cupCake = cupCake;
        this.quantity = quantity;
        this.price = cupCake.getPrice() * (double) quantity;

    }

    /**
     * @return the info
     */
    public String getInfo()
    {
        return getToppingName() + getBottomName() + quantity + "" + price;
    }

    @Override
    public String toString()
    {
        return cupCake + ". Quantity: " + quantity + ". Price: " + price;
    }

    /**
     * @return the cupCake
     */
    public CupCake getCupCake()
    {
        return cupCake;
    }

    /**
     * @return the quantity
     */
    public int getQuantity()
    {
        return quantity;
    }

    /**
     * @return the totalPrice
     */
    public double getPrice()
    {
        return price;
    }

    public String getToppingName()
    {
        return cupCake.getTopping().getName();
    }

    public String getBottomName()
    {
        return cupCake.getBottom().getName();
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity)
    {
        this.quantity = quantity;
    }

    public void calculatePrice()
    {
        this.price = cupCake.getPrice() * (double) quantity;
    }

}
