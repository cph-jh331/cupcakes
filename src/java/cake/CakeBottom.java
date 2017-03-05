package cake;

import java.io.Serializable;

public class CakeBottom implements Serializable{

    private String name;
    private double price;

    public CakeBottom(String name, double price)
    {
        this.name = name;
        this.price = price;
    }

    /**
     * @return the name
     */
    public String getName()
    {
        return name;
    }

    /**
     * @return the price
     */
    public double getPrice()
    {
        return price;
    }

}
