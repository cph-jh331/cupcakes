package cake;

import java.io.Serializable;

public class CupCake implements Serializable {

    private CakeTopping topping;
    private CakeBottom bottom;
    private double price;

    public CupCake(CakeTopping topping, CakeBottom bottom)
    {
        this.topping = topping;
        this.bottom = bottom;

        price = cupCakesCalcPrice(topping, bottom);

    }

    @Override
    public String toString()
    {
        return "Cupcake with a " + topping.getName() + " topping and a " + bottom.getName() + " bottom";
    }

    private double cupCakesCalcPrice(CakeTopping topping, CakeBottom bottom)
    {
        double sum = (topping.getPrice() + bottom.getPrice());
        return sum;
    }

    /**
     * @return the topping
     */
    public CakeTopping getTopping()
    {
        return topping;
    }

    /**
     * @return the bottom
     */
    public CakeBottom getBottom()
    {
        return bottom;
    }

    /**
     * @return the price
     */
    public double getPrice()
    {
        return price;
    }

}
